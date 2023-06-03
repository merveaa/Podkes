import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podkes/language/colors.dart';
import 'package:podkes/screens/home_screen.dart';
import 'package:podkes/screens/play_screen.dart';
//import 'package:podkes/screens/home_screen.dart';
import 'package:podkes/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ProjectColors().mainBGColor,
          appBarTheme: //tüm appbarlarda geçerli olmasını istediğimiz özelllikleri buraya yazacapğız
              const AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0)),
      home: const HomeScreen(),
    );
  }
}
