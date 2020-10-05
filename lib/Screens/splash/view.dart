import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../colorConstants.dart';

class Splash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  SystemChrome.setEnabledSystemUIOverlays([]);
    Timer(Duration(seconds: 4), () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int loggedIn = prefs.getInt('loggedIn');
  if(loggedIn != null) {
    if(loggedIn == 0) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else if(loggedIn == 1) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  } else {
    Navigator.of(context).pushReplacementNamed('/login');
  }
});
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryDarkVTheme, primaryDarkTheme],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
        ),
      ),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey,
                  child: Text(
            "SCHOLAR",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 40 ,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8,
              decoration: TextDecoration.none, 
            ),
          ),
        ),
      ),
    );
  }
}
