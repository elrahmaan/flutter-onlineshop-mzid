import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash:
            '[n]https://t4.ftcdn.net/jpg/03/34/07/75/360_F_334077587_NsRtBwBniM0FkYxHcMIDpmjAidUhGtLU.jpg',
        nextScreen: Home(),
        backgroundColor: Color(0xFF07080A),
        splashTransition: SplashTransition.scaleTransition,
        duration: 2700,
      ),
    );
  }
}
