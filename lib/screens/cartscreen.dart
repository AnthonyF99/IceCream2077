import 'package:flutter/material.dart';
import 'package:icecream/components/cart_item.dart';
import 'package:icecream/model/cart.dart';
import 'package:icecream/model/ice_cream.dart';
import 'package:icecream/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final bool isNavigatedFromMenu;

  const CartPage({super.key, this.isNavigatedFromMenu = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (isNavigatedFromMenu) {
              Navigator.pop(context); // Retour à la page précédente
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      const NavigationExample(), //Retour à la navigation principale
                ),
              );
            }
          },
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              const Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  //Get individual iceCream
                  IceCream individualIceCream = value.getUserCart()[index];

                  //Return the cart item
                  return CartItem(
                    icecream: individualIceCream,
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
