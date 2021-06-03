import 'package:flutter/material.dart';
import 'package:online_shop/widgets/product_item.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
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
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child: ProductItem(
                                image:
                                    "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg",
                                price: 150000,
                                name: "Kaos 1",
                              )),
                          InkWell(
                            onTap: () {},
                            child: ProductItem(
                              image:
                                  "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg",
                              price: 150000,
                              name: "Kaos 1",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                              onTap: () {},
                              child: ProductItem(
                                image:
                                    "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg",
                                price: 150000,
                                name: "Kaos 1",
                              )),
                          InkWell(
                            onTap: () {},
                            child: ProductItem(
                              image:
                                  "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg",
                              price: 150000,
                              name: "Kaos 1",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
