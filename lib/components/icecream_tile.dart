import 'package:flutter/material.dart';
import 'package:icecream/model/ice_cream.dart';

class IceCreamTile extends StatelessWidget {
  IceCream icecream;
  IceCreamTile({super.key, required this.icecream});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Ice Cream Name
            Text(
              icecream.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20))),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )))
                ],
              ),
            )

            //button to add to cart
          ],
        ));
  }
}
