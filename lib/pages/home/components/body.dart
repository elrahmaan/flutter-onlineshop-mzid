import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/product_list.dart';
import 'package:online_shop/widgets/category_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/widgets/product_item.dart';
import 'discount_banner.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _carouselImage(),
          DiscountBanner(),
          _category(),
          _featuredProduct(),
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
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c90bb65-3c93-4f38-8f43-0469c153c1e0/delvfxb-cbd10e3e-425d-4f2a-bea0-560194eb66d8.png/v1/fill/w_1191,h_671,q_70,strp/slide1_by_zanynn_delvfxb-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIxIiwicGF0aCI6IlwvZlwvMmM5MGJiNjUtM2M5My00ZjM4LThmNDMtMDQ2OWMxNTNjMWUwXC9kZWx2ZnhiLWNiZDEwZTNlLTQyNWQtNGYyYS1iZWEwLTU2MDE5NGViNjZkOC5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.gzY95n36t-8bj_UVpdyAAcLoTzd12SGDJGD8Bw2hATM"),
          NetworkImage(
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c90bb65-3c93-4f38-8f43-0469c153c1e0/delvfvz-e79563ce-22dc-4b24-ad92-c1a33342a59b.png/v1/fill/w_1191,h_671,q_70,strp/slide2_by_zanynn_delvfvz-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIxIiwicGF0aCI6IlwvZlwvMmM5MGJiNjUtM2M5My00ZjM4LThmNDMtMDQ2OWMxNTNjMWUwXC9kZWx2ZnZ6LWU3OTU2M2NlLTIyZGMtNGIyNC1hZDkyLWMxYTMzMzQyYTU5Yi5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.FQm3OdB5I2qYSUBLQMOHEEnx4VpkI8D8j1W2mEXhJNs"),
          NetworkImage(
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2c90bb65-3c93-4f38-8f43-0469c153c1e0/delvg0h-fc35624e-5dec-4ef4-9b46-a070484ef8ea.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJjOTBiYjY1LTNjOTMtNGYzOC04ZjQzLTA0NjljMTUzYzFlMFwvZGVsdmcwaC1mYzM1NjI0ZS01ZGVjLTRlZjQtOWI0Ni1hMDcwNDg0ZWY4ZWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AlAKUlsM9U1gnPl7gbLMk2hjLAsinodoZ0iv8iCWYHE"),
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
            // height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //ITEM CATEGORY
                // Setiap kategori mengirimkan namanya agar dapat diterima dan di filter pada halaman Product List
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            ProductList(category: "T-Shirt")));
                  },
                  child: CategoryItem(
                    image: 'https://img.icons8.com/ios/452/t-shirt--v1.png',
                    name: "T-Shirt",
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProductList(category: "Jacket")));
                  },
                  child: CategoryItem(
                    image: 'https://img.icons8.com/ios/2x/tracksuit.png',
                    name: "Jacket",
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProductList(category: "Pants")));
                  },
                  child: CategoryItem(
                    image: 'https://img.icons8.com/ios/2x/trousers.png',
                    name: "Pants",
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            ProductList(category: "Accessories")));
                  },
                  child: CategoryItem(
                    image: 'https://img.icons8.com/ios/2x/apple-watch.png',
                    name: "Accessories",
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProductList(category: "Helmet")));
                  },
                  child: CategoryItem(
                    image: 'https://img.icons8.com/ios/2x/motorbike-helmet.png',
                    name: "Helmet",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featuredProduct() {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15, bottom: 7),
          alignment: Alignment.centerLeft,
          child: Text(
            "Featured Product",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 600,
          child: StreamBuilder<QuerySnapshot>(
            //memanggil collection data produk berdasarkan field kategori yang bernilai nama kategori yang diterima
            stream: products.where('price', isGreaterThan: 500000).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: GridView.count(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    padding: const EdgeInsets.all(10),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    scrollDirection: Axis.vertical,
                    children: snapshot.data.docs
                        .map((item) => ProductItem(
                            item['id'],
                            item['image'],
                            item['name'],
                            item['price'],
                            item['desc'],
                            item['category']))
                        .toList(),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
