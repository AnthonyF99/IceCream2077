import 'package:flutter/material.dart';
import 'package:icecream/model/ice_cream.dart';

class IceCreamTile extends StatelessWidget {
  IceCream icecream;
  void Function()? onTap;
  IceCreamTile({super.key, required this.icecream, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25),
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(2)),
          color: Colors.black.withOpacity(0.5), // Fond semi-transparent
          border: Border.all(
            color: Colors.cyanAccent, // Bordure lumineuse
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Ice Cream Name
            Text(
              icecream.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'NeuroPol',
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 5), // Déplacement de l'ombre
                      blurRadius: 10,
                      color: Colors.cyanAccent.withOpacity(0.8),
                    )
                  ]),
            ),

            //IceCream picture
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  icecream.imagePath,
                  height: 100,
                )),
            // description
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(icecream.description,
                  style: TextStyle(color: Colors.amber[50])),
            ),

            //Price + details
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Price
                      Text('\$${icecream.price}',
                          style: const TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'NeuroPol')),
                    ],
                  ),
                  //Add to cart button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            )

            //button to add to cart
          ],
        ));
  }
}
