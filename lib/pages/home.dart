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
        children: <Widget>[_carouselImage()],
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
}
