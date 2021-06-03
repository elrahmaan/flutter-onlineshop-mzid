import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String name;

  const CategoryItem({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: MediaQuery.of(context).size.height * 0.1 / 2.5,
          backgroundColor: Color(0xFF1C1C1C),
          // backgroundColor: Color(color),
          child: Container(
            height: 40,
            child: Image(
              color: Colors.white,
              image: NetworkImage(image),
            ),
          ),
        ),
        Text(name)
      ],
    );
  }
}