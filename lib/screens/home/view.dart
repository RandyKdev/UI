import 'package:flutter/material.dart';
import 'package:ui/screens/home/utils/sectionsBottomSheet.dart';
import 'package:ui/screens/home/utils/table.dart';

import '../../colorConstants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("SCHOLAR"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Tables(),
          ),
      ),
      drawer: Drawer(
        child: Text('Drawer'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: double.infinity / 2,
                  child: SectionsBottomSheet(),            );
              });
        },
        elevation: 20,
      ),
    );
  }
}
