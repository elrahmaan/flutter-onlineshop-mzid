import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/services/authentication.dart';
import 'package:online_shop/widgets/cart_item.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

class _CartState extends State<Cart> {
  CollectionReference carts = firestore
      .collection("carts")
      .doc(userId)
      .collection("Order " + levelOrder.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart", style: TextStyle(color: Colors.black)),
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
                builder: (ctx) => Home(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 7,
          )
        ]),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text("Total: "),
                subtitle: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: carts.snapshots(),
                    builder: (context, snapshot) {
                      int total = 0;
                      if (snapshot.hasData) {
                        //menghitung total biaya
                        snapshot.data.docs
                            .map((e) => total += e["productCost"])
                            .toList();
                        return Container(
                          child: Text(
                            total.toString() + " IDR",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF1C1C1C),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  Container(
                    child: StreamBuilder<QuerySnapshot>(
                      //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
                      stream: carts.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data.docs
                                .map((item) => CartItem(
                                      item['productImg'],
                                      item['productName'],
                                      item['productCategory'],
                                      item['productPrice'],
                                      item['productId'],
                                      item['productSize'],
                                      item['productQty'],
                                      item['productCost'],
                                    ))
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
          ],
        ),
      ),
    );
  }
}
