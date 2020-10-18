import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hello/widgets/home.dart';
import 'package:hello/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int value;

  splashTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getInt('value');
    print("data = $value");
    var _timeDuration = new Duration(seconds: 4);
    if (value == null) {
      return new Timer(_timeDuration, loginNavigation);
    }
    return new Timer(_timeDuration, homeNavigation);
    
  }

  void loginNavigation() {
    Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> LoginScreen(),
              ),
            );
  }

  void homeNavigation() {
   Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> HomeScreen(),
              ),
            );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    splashTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: ScaleAnimatedTextKit(
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Welcome",
                  ],
                  textStyle:
                      TextStyle(fontSize: 70.0, fontFamily: "Canterbury"),
                  textAlign: TextAlign.center,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
