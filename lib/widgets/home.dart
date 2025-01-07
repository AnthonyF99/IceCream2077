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
          child: Column(
            children: [
              // SEARCH
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Colors.grey[600],
                          border: OutlineInputBorder(),
                          hintText: 'Search for something yummy...',
                          hintStyle: TextStyle(color: Colors.grey)),
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
                          ),
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
                    height: 250,
                    child: ListView.builder(
                      itemCount: value
                          .getIceCreamList()
                          .where((icecream) =>
                              icecream.categories.contains("Hot Deals"))
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
                            icecream: icecream); // Afficher l'élément
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
                          ),
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

                  //HOT DEAL ITEMS
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: value
                          .getIceCreamList()
                          .where(
                              (icecream) => icecream.categories.contains("New"))
                          .length, // Number of items with the category "New"
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // Filer the items with the category "New"
                        List<IceCream> filteredList = value
                            .getIceCreamList()
                            .where((icecream) =>
                                icecream.categories.contains("New"))
                            .toList();

                        IceCream icecream =
                            filteredList[index]; // Get the filtered item
                        return IceCreamTile(icecream: icecream);
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
    );
  }
}
