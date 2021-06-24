import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/profiles/components/card_item.dart';
import 'package:online_shop/services/authentication.dart';
import 'package:online_shop/widgets/coustom_bottom_nav_bar.dart';
import 'package:online_shop/widgets/order_item.dart';
import '../../enums.dart';

import '../order_productItem.dart';
import 'components/stack_container.dart';

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

FirebaseFirestore firestore = FirebaseFirestore.instance;

class _ProfilesState extends State<Profiles> {
  CollectionReference orders = firestore.collection("orders");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            // ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) => CardItem(),
            //   shrinkWrap: true,
            //   itemCount: 6,
            // ),
            // Container(
            //   child: StreamBuilder<QuerySnapshot>(
            //     //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
            //     stream: orders.where("userId", isEqualTo: userId).snapshots(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         return Column(
            //           children: snapshot.data.docs
            //               .map((item) => OrderItem(
            //                     item['name'],
            //                     item['userEmail'],
            //                     item['address'],
            //                     item['phone'],
            //                     item['totalOrder'],
            //                     item['orderDateTime'],
            //                     item['status'],
            //                     item['collectionRef'],
            //                   ))
            //               .toList(),
            //         );
            //       } else {
            //         return Container();
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
