import 'package:flutter/material.dart';
import 'package:online_shop/pages/cart.dart';
import 'package:online_shop/pages/detail/product_detail2.dart';
import 'package:online_shop/services/authentication.dart';
import 'package:online_shop/widgets/coustom_bottom_nav_bar.dart';
import 'package:online_shop/pages/order_list.dart';

import '../../enums.dart';
import '../login_page.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: _drawer(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name, style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(imageUrl),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(
              email,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              setState(() {});
            },
          ),
          ListTile(
            title: Text('Cart'),
            leading: Icon(Icons.shopping_cart),
            onTap: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Cart()));
              });
            },
          ),
          ListTile(
            title: Text('Orders'),
            leading: Icon(Icons.payments),
            onTap: () {
              setState(() {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => OrderList()));
              });
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), ModalRoute.withName('/'));
            },
          ),
        ],
      ),
    );
  }
}
