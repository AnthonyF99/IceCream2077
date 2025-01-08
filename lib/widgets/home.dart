import 'package:flutter/material.dart';
import 'package:icecream/components/icecream_tile.dart';
import 'package:icecream/model/ice_cream.dart';
import 'package:provider/provider.dart';
import 'package:icecream/model/cart.dart';
import 'package:icecream/model/auth_provider.dart';

class MyHomeWidget extends StatelessWidget {
  const MyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeWidget(); // Utilise directement le widget
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // Add Ice Cream to cart
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
    bool isConnected = Provider.of<AuthProvider>(context).isConnected;

    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: isConnected
              ? Text(
                  "Hey, username",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text("Hey, guest"),
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
                  1.0
                ], // Contrôle de la transition des couleurs
              ),
            ),
            child: Column(
              children: [
                // SEARCH
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            suffixIconColor: Colors.grey[600],
                            border: OutlineInputBorder(),
                            hintText: 'Search for something yummy...',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),

                //MESSAGE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Get something yummy for you",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Column(
                  children: [
                    // HOT DEALS MESSAGE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            'HOT DEALS',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CyberwayRiders',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                    color: Colors.pinkAccent,
                                  )
                                ]),
                          ),
                        ),
                        const Text(
                          'See more',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent),
                        ),
                      ],
                    ),

                    //HOT DEAL IceCream for sale
                    SizedBox(
                      height: 255,
                      child: ListView.builder(
                        itemCount: value
                            .getIceCreamList()
                            .where((icecream) =>
                                icecream.categories.contains("Hot Deals"))
                            .take(4)
                            .length, // Nombre d'éléments avec la catégorie "Hot Deals"
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // Filtrer les éléments avec la catégorie "Hot Deals"
                          List<IceCream> filteredList = value
                              .getIceCreamList()
                              .where((icecream) =>
                                  icecream.categories.contains("Hot Deals"))
                              .toList();

                          IceCream icecream =
                              filteredList[index]; // Obtenir l'élément filtré
                          return IceCreamTile(
                            icecream: icecream,
                            onTap: () => addIceCreamToCart(icecream),
                          ); // Afficher l'élément
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // NEWS ARRIVALS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            'NEW ARRIVALS',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CyberwayRiders',
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                    color: Colors.pinkAccent,
                                  )
                                ]),
                          ),
                        ),
                        const Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),

                    //NEW Ice Cream
                    SizedBox(
                      height: 255,
                      child: ListView.builder(
                        itemCount: value
                            .getIceCreamList()
                            .where((icecream) =>
                                icecream.categories.contains("New"))
                            .take(4)
                            .length, // Number of Ice Cream with the category "New"
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // Filer the Ice Cream with the category "New"
                          List<IceCream> filteredList = value
                              .getIceCreamList()
                              .where((icecream) =>
                                  icecream.categories.contains("New"))
                              .toList();

                          IceCream icecream =
                              filteredList[index]; // Get the filtered item
                          return IceCreamTile(
                            icecream: icecream,
                            onTap: () => addIceCreamToCart(icecream),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
