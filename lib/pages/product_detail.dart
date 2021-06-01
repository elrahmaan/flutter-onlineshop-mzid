import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
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
        child: ListView(
          children: <Widget>[
            //IMAGE
            _productImage(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //NAME and PRICE
                  _productNameAndPrice(),
                  SizedBox(
                    height: 10,
                  ),

                  //DESCRIPTION
                  _description(),
                  SizedBox(
                    height: 15,
                  ),

                  //SIZE SELECTION
                  _chooseSize(),
                  SizedBox(
                    height: 15,
                  ),

                  //COLOR SELECTION
                  _chooseColor(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Center(
      child: Container(
        width: 380,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productNameAndPrice() {
    return Container(
      height: 70,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Kaos Oblong",
                  style: TextStyle(
                    fontSize: 23,
                  )),
              Text(
                "IDR 100.000",
                style: TextStyle(
                    color: Color(0xFF1C1C1C),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return Wrap(
      children: <Widget>[
        Text("Description :", style: TextStyle(fontSize: 18)),
        SizedBox(
          height: 30,
        ),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  Widget _chooseSize() {
    return Container(
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose your size :",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),

          //Size Item
          Container(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Size S
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    child: Text(
                      "S",
                    ),
                    color: Colors.grey[200],
                    onPressed: () {},
                  ),
                ),

                //Size M
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    child: Text(
                      "M",
                    ),
                    color: Colors.grey[200],
                    onPressed: () {},
                  ),
                ),

                //Size L
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    child: Text(
                      "L",
                    ),
                    color: Colors.grey[200],
                    onPressed: () {},
                  ),
                ),

                //Size XL
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    child: Text(
                      "XL",
                    ),
                    color: Colors.grey[200],
                    onPressed: () {},
                  ),
                ),

                //Size XXL
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    child: Text(
                      "XXL",
                    ),
                    color: Colors.grey[200],
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chooseColor() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose your color :",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),

          //Color Item
          Container(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Red
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.15), width: 2)),
                    onPressed: () {},
                  ),
                ),

                //blue
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.15), width: 2)),
                    onPressed: () {},
                  ),
                ),

                //grey
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    color: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.15), width: 2)),
                    onPressed: () {},
                  ),
                ),

                //black
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.15), width: 2)),
                    onPressed: () {},
                  ),
                ),

                //white
                Container(
                  height: 65,
                  width: 65,
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.15), width: 2)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
