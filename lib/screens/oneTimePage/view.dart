import 'dart:async';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../colorConstants.dart';

class OneTimePage extends StatefulWidget {
  _OneTimePageState createState() => _OneTimePageState();
}

class _OneTimePageState extends State<OneTimePage> {
  int counter = 0;

String user = '';
  void updateState(String username) {
    setState(() => user = username);
  }
  @override
  Widget build(BuildContext context) {
     Timer(Duration(seconds: 0), () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = prefs.getString('username');
  print(user.length);
  if(user.length == 0) updateState(username);
});
  String greet = "Hi $user, \n" 
  "Welcome to SCHOLAR, the easiest way to register and apply to a school";
  if(user.length == 0) return Container();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          bottom: 50,
          left: 30,
          right: 30,
        ),
        color: purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    counter == 0
                        ? _typer(speed: 300, text: greet, head: true)
                        : _typed(text: greet),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 85,
                  width: 300,
                  child: OutlineButton(
                    textColor: secondaryTheme,
                    highlightedBorderColor: secondaryTheme,
                    borderSide: BorderSide(color: secondaryTheme,),
                    onPressed: () {Navigator.of(context).pushReplacementNamed('/dashboard');},
                    child: Text(
                      'START APPLICATION',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 4,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  child: OutlineButton(
                    textColor: Colors.white60,
                    highlightedBorderColor: Colors.white60,
                    borderSide: BorderSide(color: Colors.white60,),
                    child: Text("Next"),
                    onPressed: () { Navigator.of(context).pushReplacementNamed('/home');},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typer({String text, int speed, bool head}) {
    return TypewriterAnimatedTextKit(
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: speed),
      onFinished: () => setState(() => counter++),
      text: [text],
      textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "monospace"),
      textAlign: TextAlign.left,
      alignment: AlignmentDirectional.topStart,
    );
  }

  Widget _typed({String text}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "monospace"),
    );
  }
}
