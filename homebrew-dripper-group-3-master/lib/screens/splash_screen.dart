import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOMEBREW",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Norwester',
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                  letterSpacing: 3.5),
            ),
            Text("Handmade Coffee",
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Kollektif',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    letterSpacing: 1.5))
          ],
        ),
      ),
    );
  }
}
