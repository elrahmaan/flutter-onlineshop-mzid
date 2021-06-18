import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final String productImg;
  final String productName;
  final String productCategory;
  final int productPrice;
  final String productSize;
  final int productQty;
  final int productCost;

  OrderItem(this.productImg, this.productName, this.productCategory,
      this.productPrice, this.productSize, this.productQty, this.productCost);

  @override
  Widget build(BuildContext context) {
    var formatNumber = NumberFormat("#,###");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Image.network(
            // "https://www.freeiconspng.com/uploads/belt-png-14.png",
            productImg,
            width: 80,
            height: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                // "Long Sleeve",
                productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(productCategory),
              Text(productPrice.toString())
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            children: [
              Text("Qty: "),
              Text(productQty.toString()),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                // "IDR 200,000",
                "IDR " + formatNumber.format(productCost).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
