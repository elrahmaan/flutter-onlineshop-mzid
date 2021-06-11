import 'package:flutter/material.dart';
import 'package:online_shop/services/databases.dart';

class CartItem extends StatelessWidget {
  final String productImg;
  final String productName;
  final String productCategory;
  final int productPrice;
  final String productId;
  final String productSize;
  final int productQty;
  final int productCost;

  const CartItem(
      this.productImg,
      this.productName,
      this.productCategory,
      this.productPrice,
      this.productId,
      this.productSize,
      this.productQty,
      this.productCost);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
              productImg,
              width: 80,
            ),
          ),
          Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            productCategory,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "Size: " + productSize,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        productPrice.toString() + " IDR",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left), onPressed: () {}),
                    Container(
                      // padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productQty.toString(),
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
            child: Column(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      size: 30,
                    ),
                    onPressed: () {
                      //menghapus item cart
                      deleteItemCart(productId);
                    }),
                Text(
                  // "100.000 IDR",
                  productCost.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
