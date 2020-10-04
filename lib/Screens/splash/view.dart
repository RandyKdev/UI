import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/services.dart';

import '../../colorConstants.dart';

class Splash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  SystemChrome.setEnabledSystemUIOverlays([]);
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
