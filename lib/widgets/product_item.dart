import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  ProductItem(this.image, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    // variabel untuk mengatur format angka untuk harga
    var formatNumber = NumberFormat("#,###");
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  image,
                  width: double.infinity,
                  height: 200,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  formatNumber.format(price).toString() + " IDR",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
