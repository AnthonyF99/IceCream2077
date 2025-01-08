import 'package:flutter/material.dart';
import 'package:icecream/components/icecream_tile.dart';
import 'package:icecream/model/ice_cream.dart';
import 'package:icecream/model/cart.dart';
import 'package:provider/provider.dart';

class ProductCardComponent extends StatelessWidget {
  const ProductCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductCard();
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void addIceCreamToCart(IceCream icecream) {
    Provider.of<Cart>(context, listen: false).addItemToCart(icecream);

    //Alert the user, iceCream successfully added

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Succesfully added!"),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Classic',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // Deuxième texte (tu peux en ajouter autant que tu veux)
              const Text(
                'Seasonal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // Troisième texte
              const Text(
                'Dairy Free',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Sundae',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          // Liste des glaces
          Container(
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
                  1.0
                ], // Contrôle de la transition des couleurs
              ),
            ),
            margin: EdgeInsets.only(right: 25), // To center the container
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  height: 650,
                  child: ListView.builder(
                      itemCount: value.getIceCreamList().length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        IceCream icecream = value.getIceCreamList()[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0), // Vertical space between items
                          child: IceCreamTile(
                            icecream: icecream,
                            onTap: () => addIceCreamToCart(icecream),
                          ),
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
