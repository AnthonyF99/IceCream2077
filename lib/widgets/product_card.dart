import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  // Déclare une liste de glaces avec des images et des noms
  final List<Map<String, String>> iceCreamList = [
    {
      "name": "Vanilla Bean",
      "price": "3.50",
      "image":
          "https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg",
    },
    {
      "name": "Mint Chip",
      "price": "1.00",
      "image":
          "https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg",
    },
    {
      "name": "Double Chocolate",
      "price": "1.00",
      "image":
          "https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg",
    },
    {
      "name": "Strawberry Shortcake",
      "price": "1.00",
      "image":
          "https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Wrap(
          spacing: 16.0, // Espace horizontal entre les éléments
          runSpacing: 16.0, // Espace vertical entre les lignes
          children: iceCreamList.map((iceCream) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                          image: NetworkImage(
                            iceCream["image"]!,
                          ),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(height: 8.0),
                Text(
                  iceCream["name"]!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  iceCream["price"]!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0), // Espacement avant le bouton
        // Bouton en dessous de la liste
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout clicked!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[400],
            ),
            child: const Text('Add to Cart'),
          ),
        ),
      ],
    );
  }
}
