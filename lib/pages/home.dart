import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MZ.ID",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _carouselImage(),
          _category(),
          SizedBox(
            height: 17,
          ),
          _recommendProduct(),
          SizedBox(
            height: 17,
          ),
          _newProduct(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'User',
          ),
        ],
      ),
    );
  }

  Widget _carouselImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Carousel(
        autoplay: true,
        // showIndicator: false,
        images: [
          NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdeVR36L4bLlswYEzqGqqjHujed5qaYR5kOQ&usqp=CAU"),
          NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGJslhUnudzJtKWKC2NK8g8wdSC8wqNZGvNQ&usqp=CAU"),
          NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHcx6Ju8zOXXlRgOlGeqQCIwOvlxwI6PY05Q&usqp=CAU"),
        ],
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.grey[300],
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.black.withOpacity(0.17),
      ),
    );
  }

  Widget _category() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1 - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            // height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //ITEM CATEGORY
                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
                      backgroundColor: Color(0xFF1C1C1C),
                      // backgroundColor: Color(color),
                      child: Container(
                        height: 40,
                        child: Image(
                          color: Colors.white,
                          image: NetworkImage(
                              'https://img.icons8.com/ios/452/t-shirt--v1.png'),
                        ),
                      ),
                    ),
                    Text("T-Shirt")
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
                      backgroundColor: Color(0xFF1C1C1C),
                      // backgroundColor: Color(color),
                      child: Container(
                        height: 40,
                        child: Image(
                          color: Colors.white,
                          image: NetworkImage(
                              'https://img.icons8.com/ios/452/t-shirt--v1.png'),
                        ),
                      ),
                    ),
                    Text("T-Shirt")
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
                      backgroundColor: Color(0xFF1C1C1C),
                      // backgroundColor: Color(color),
                      child: Container(
                        height: 40,
                        child: Image(
                          color: Colors.white,
                          image: NetworkImage(
                              'https://img.icons8.com/ios/452/t-shirt--v1.png'),
                        ),
                      ),
                    ),
                    Text("T-Shirt")
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
                      backgroundColor: Color(0xFF1C1C1C),
                      // backgroundColor: Color(color),
                      child: Container(
                        height: 40,
                        child: Image(
                          color: Colors.white,
                          image: NetworkImage(
                              'https://img.icons8.com/ios/452/t-shirt--v1.png'),
                        ),
                      ),
                    ),
                    Text("T-Shirt")
                  ],
                ),

                Column(
                  children: [
                    CircleAvatar(
                      maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
                      backgroundColor: Color(0xFF1C1C1C),
                      // backgroundColor: Color(color),
                      child: Container(
                        height: 40,
                        child: Image(
                          color: Colors.white,
                          image: NetworkImage(
                              'https://img.icons8.com/ios/452/t-shirt--v1.png'),
                        ),
                      ),
                    ),
                    Text("T-Shirt")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _recommendProduct() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Recommended",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View more",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width:
                              MediaQuery.of(context).size.width * 0.2 * 2 + 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: 160,
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "IDR 100.000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xFF1C1C1C)),
                                    ),
                                    Container(
                                      child: Text(
                                        "Kaos Oblong",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width:
                              MediaQuery.of(context).size.width * 0.2 * 2 + 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: 160,
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "IDR 100.000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xFF1C1C1C)),
                                    ),
                                    Container(
                                      child: Text(
                                        "Kaos",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _newProduct() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "New Product",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View more",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width:
                              MediaQuery.of(context).size.width * 0.2 * 2 + 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: 160,
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "IDR 100.000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xFF1C1C1C)),
                                    ),
                                    Container(
                                      child: Text(
                                        "Kaos",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width:
                              MediaQuery.of(context).size.width * 0.2 * 2 + 30,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: 160,
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "IDR 100.000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xFF1C1C1C)),
                                    ),
                                    Container(
                                      child: Text(
                                        "Kaos",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
