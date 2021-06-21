import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/pages/home/home_screen.dart';
import 'package:online_shop/widgets/product_item.dart';

import 'home/components/home_header.dart';

class ProductList extends StatelessWidget {
  final String category;
  ProductList({this.category});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    //mereferensikan untuk memanggil collection data "produk"
    CollectionReference products = firestore.collection("products");

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            HomeHeader(),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                category,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<QuerySnapshot>(
                //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
                stream:
                    products.where('category', isEqualTo: category).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      padding: const EdgeInsets.all(10),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      scrollDirection: Axis.vertical,
                      children: snapshot.data.docs
                          .map((item) => ProductItem(
                              item['id'],
                              item['image'],
                              item['name'],
                              item['price'],
                              item['desc'],
                              item['category']))
                          .toList(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
