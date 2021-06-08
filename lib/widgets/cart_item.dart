import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String productId;
  final int quantity;

  const CartItem(
      this.image, this.name, this.price, this.productId, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              // "https://purepng.com/public/uploads/large/wrist-watch-ogx.png",
              image,
              width: 80,
            ),
          ),
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    // "Product",
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left), onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.chevron_right), onPressed: () {}),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              // "100.000 IDR",
              price.toString(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
