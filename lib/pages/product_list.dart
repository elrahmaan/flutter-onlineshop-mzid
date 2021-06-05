import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final String category;
  ProductList({this.category});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    //mereferensikan untuk memanggil collection data "produk"
    CollectionReference products = firestore.collection("products");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MZ.ID", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp, color: Colors.black),
            label: 'User',
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                category,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<QuerySnapshot>(
                //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
                future: products.where('category', isEqualTo: category).get(),
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
                          .map((item) => ProductItem(item['image'],
                              item['name'], item['price'], item['desc']))
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
