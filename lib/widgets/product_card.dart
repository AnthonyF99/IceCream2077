import 'package:flutter/material.dart';
import 'package:icecream/components/icecream_tile.dart';
import 'package:icecream/model/ice_cream.dart';
import 'package:icecream/model/cart.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
            margin: EdgeInsets.only(right: 25), // To center the container
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        IceCream icecream = value.getIceCreamList()[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0), // Vertical space between items
                          child: IceCreamTile(icecream: icecream),
                        );
                      })),
            ),
          ),
          const SizedBox(height: 16.0), // Espacement avant le bouton
          // Bouton en dessous de la liste
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product name add to cart')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[600],
                      foregroundColor: Colors.black),
                  child: const Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
