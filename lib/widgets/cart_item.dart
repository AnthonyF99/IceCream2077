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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(2)),
        color: Color.fromRGBO(0, 0, 0, 0.5),
        border: Border.all(
          color: Colors.cyanAccent, // Bordure lumineuse
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 255, 255, 0.3),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.icecream.imagePath),
        title: Text(widget.icecream.name),
        subtitle: Text(widget.icecream.price),
        textColor: Colors.white,
        trailing: IconButton(
          onPressed: removeItemFromCart,
          icon: Icon(Icons.delete),
          color: Colors.white,
        ),
      ),
    );
  }
}
