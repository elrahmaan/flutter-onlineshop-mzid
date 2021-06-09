import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/services/authentication.dart';
import 'package:online_shop/services/databases.dart';
import 'package:online_shop/widgets/cart_item.dart';

class Cart extends StatefulWidget {
  // const Cart({ Key? key }) : super(key: key);
  final total;

  Cart({this.total});
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
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              child: Container(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Checkout (" + widget.total.toString() + " IDR)",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xFF1C1C1C),
                  onPressed: () {},
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
                    child: FutureBuilder<QuerySnapshot>(
                      //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
                      future: carts.get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data.docs
                                .map((item) => CartItem(
                                      item['productImg'],
                                      item['productName'],
                                      item['productPrice'],
                                      item['productId'],
                                      item['productQty'],
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
            // Container(
            //   height: 120,
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             "Subtotal",
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //           Text(
            //             "Discount",
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 2,
            //           ),
            //           Text(
            //             "Total",
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             "100,000 IDR",
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //           Text(
            //             "50%",
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 2,
            //           ),
            //           Text(
            //             totalCart.toString(),
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
