import 'package:flutter/material.dart';
import 'package:podkes/language/colors.dart';
//import 'package:podkes/screens/home_screen.dart';
import 'package:podkes/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorItems().mainBGColor),
      home: const SplashScreen(),
    );
  }
}
