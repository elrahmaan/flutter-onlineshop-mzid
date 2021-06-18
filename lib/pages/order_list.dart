import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/widgets/order_item.dart';
import 'package:online_shop/services/authentication.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

class _OrderListState extends State<OrderList> {
  CollectionReference orders = firestore.collection("orders");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Transaction History",
            style: TextStyle(color: Colors.black)),
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
      ),
      body: ListView(
        children: [
          Container(
            child: StreamBuilder<QuerySnapshot>(
              //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
              stream: orders.where("userId", isEqualTo: userId).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.docs
                        .map((item) => OrderItem(
                              item['name'],
                              item['userEmail'],
                              item['address'],
                              item['phone'],
                              item['totalOrder'],
                              item['orderDateTime'],
                              item['status'],
                              item['collectionRef'],
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
    );
  }
}
