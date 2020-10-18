import 'package:flutter/material.dart';
import 'package:hello/widgets/splash.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
    );
  }
}