import 'package:flutter/material.dart';
import 'package:online_shop/pages/cart.dart';
import 'package:online_shop/pages/home.dart';
import 'package:online_shop/pages/home/home_screen.dart';
import 'package:online_shop/pages/profile/profile_screen.dart';
import 'package:online_shop/services/databases.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () async {
                await getUserLevel();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Cart()));
              }),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}