import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../colorConstants.dart';

class OneTimePage extends StatefulWidget {
  _OneTimePageState createState() => _OneTimePageState();
}

class _OneTimePageState extends State<OneTimePage> {
  int counter = 0;
  String greet = "Hi Randy, \n" 
  "Welcome to SCHOLAR, the easiest way to register and apply for school";
  @override
  Widget build(BuildContext context) {
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
                        ? _typer(speed: 300, text: 'Hi Randy,', head: true)
                        : _typed(text: 'Hi Randy,', head: true),
                    counter == 1
                        ? _typer(
                            speed: 300,
                            text:
                                'Welcome to SCHOLAR, the easiest ....................',
                            head: false)
                        : Container(),
                    counter > 1
                        ? _typed(
                            text:
                                'Welcome to SCHOLAR, the easiest ....................',
                            head: false)
                        : Container(),
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
                  child: RaisedButton(
                    color: secondaryTheme,
                    textColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(0.0),
                    ),
                    onPressed: () {},
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
                    textColor: secondaryTheme,
                    highlightedBorderColor: secondaryTheme,
                    borderSide: BorderSide(color: secondaryTheme,),
                    child: Text("Skip"),
                    onPressed: () {},
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
          fontSize: head ? 22 : 19,
          color: Colors.white,
          fontFamily: "monospace"),
      textAlign: TextAlign.left,
      alignment: AlignmentDirectional.topStart,
    );
  }

  Widget _typed({String text, bool head}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: head ? 22 : 19,
          color: Colors.white,
          fontFamily: "monospace"),
    );
  }
}
