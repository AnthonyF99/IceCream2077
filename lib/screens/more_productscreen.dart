import 'package:flutter/material.dart';
import 'package:icecream/widgets/icecream_tile.dart';
import 'package:icecream/model/ice_cream.dart';
import 'package:provider/provider.dart';
import 'package:icecream/model/cart.dart';

class MoreProductScreen extends StatefulWidget {
  final bool isHotDeals;

  const MoreProductScreen({super.key, required this.isHotDeals});

  @override
  MoreProductScreenState createState() => MoreProductScreenState();
}

class MoreProductScreenState extends State<MoreProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isHotDeals
            ? 'Hot Deals'
            : 'New Arrivals'), // Affiche le titre en fonction du paramètre
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1B1B1B),
                Color(0xFF311B92),
                Color(0xFF00BCD4),
              ],
              stops: [
                0.2,
                0.6,
                1.0,
              ],
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  // Message pour Hot Deals ou New Arrivals
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.isHotDeals
                              ? 'HOT DEALS'
                              : 'NEW ARRIVALS', // Texte conditionnel
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CyberwayRiders',
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 5),
                                blurRadius: 10,
                                color: Colors.pinkAccent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // List of products : Hot Deals or New Arrivals
                  SizedBox(
                    height: 650,
                    child: Consumer<Cart>(
                      builder: (context, cart, child) {
                        // Filtrage des crèmes glacées en fonction du paramètre isHotDeals
                        List<IceCream> filteredList = cart
                            .getIceCreamList()
                            .where((icecream) => icecream.categories.contains(
                                widget.isHotDeals ? "Hot Deals" : "New"))
                            .toList();

                        return ListView.builder(
                          itemCount: filteredList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            IceCream icecream = filteredList[index];
                            return IceCreamTile(
                              icecream: icecream,
                              onTap: () => addIceCreamToCart(icecream),
                              isMenuPage: false,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Ajout de la crème glacée au panier
  void addIceCreamToCart(IceCream icecream) {
    Provider.of<Cart>(context, listen: false).addItemToCart(icecream);

    // Affichage d'un message d'alerte pour informer l'utilisateur
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Successfully added!"),
              content: Text('Check your cart'),
            ));
  }
}
