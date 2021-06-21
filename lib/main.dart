import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/pages/home/home_screen.dart';
import 'package:online_shop/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_shop/pages/splash/splash_screen.dart';
import 'package:online_shop/routes.dart';
import 'package:online_shop/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: AnimatedSplashScreen(
        splash:
            '[n]https://t4.ftcdn.net/jpg/03/34/07/75/360_F_334077587_NsRtBwBniM0FkYxHcMIDpmjAidUhGtLU.jpg',
        nextScreen: SplashScreen(),
        backgroundColor: Color(0xFF07080A),
        splashTransition: SplashTransition.scaleTransition,
        duration: 2700,
      ),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      routes: routes,
    );
  }
}
