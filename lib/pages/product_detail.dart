import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String desc;

  ProductDetail({this.image, this.name, this.price, this.desc});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

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
          onPressed: () {
            Navigator.of(context).pop();
          },
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
              padding: EdgeInsets.all(12),
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
                  SizedBox(
                    height: 15,
                  ),

                  //SET QUANTITY
                  _setQuantity(),
                  SizedBox(
                    height: 15,
                  ),

                  //ADD TO CART
                  _addToCartButton(),
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
                  image: NetworkImage(widget.image),
                  // image: NetworkImage(
                  //     "https://redcanoebrands.com/wp-content/uploads/2013/11/cessna-blue-tshirt-416x416.jpg"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productNameAndPrice() {
    var formatNumber = NumberFormat("#,###");
    return Container(
      height: 70,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.name,
                // "Kaos Oblong",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              Text(
                // "IDR 100.000",
                formatNumber.format(widget.price).toString() + " IDR",
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
          widget.desc,
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

  Widget _setQuantity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Quantity",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              color: Color(0xFF1C1C1C),
              child: InkWell(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (quantity > 1) {
                      quantity--;
                    }
                  });
                },
              ),
            ),
            Container(
              height: 40,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF1C1C1C),
                ),
              ),
              child: Text(
                quantity.toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              color: Color(0xFF1C1C1C),
              child: InkWell(
                child: Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addToCartButton() {
    return Container(
      height: 60,
      child: Container(
        height: 45,
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            "Add To Cart",
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF1C1C1C),
          onPressed: () {},
        ),
      ),
    );
  }
}
