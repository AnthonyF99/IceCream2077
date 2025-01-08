import 'package:flutter/material.dart';
import 'package:icecream/model/cart.dart';
import 'package:provider/provider.dart';
import '../model/ice_cream.dart';

class CartItem extends StatefulWidget {
  IceCream icecream;
  CartItem({super.key, required this.icecream});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //Remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.icecream);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.icecream.imagePath),
        title: Text(widget.icecream.name),
        subtitle: Text(widget.icecream.price),
        trailing:
            IconButton(onPressed: removeItemFromCart, icon: Icon(Icons.delete)),
      ),
    );
  }
}
