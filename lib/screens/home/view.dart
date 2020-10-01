import 'package:flutter/material.dart';
import 'package:ui/screens/home/homeBody.dart';
import 'package:ui/screens/home/utils/sectionsBottomSheet.dart';

import 'package:ui/colorConstants.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  void changePageIndex(int index) => setState(() => pageIndex = index);
  @override
  Widget build(BuildContext context) {
    print(pageIndex);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("SCHOLAR"),
      ),
      body: HomeBody(pageIndex),
      drawer: Drawer(
        child: Container(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _floatingActionButton(context),
    );
  }  

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: purple,
      child: Icon(Icons.arrow_upward),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: double.infinity / 2,
              child: SectionsBottomSheet(changePageIndex),
            );
          },
        );
      },
      elevation: 20,
    );
  }
}
