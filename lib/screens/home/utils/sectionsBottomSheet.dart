import 'package:flutter/material.dart';

import '../../../colorConstants.dart';

class SectionsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowElem(),
                _rowElem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _rowElem() {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
      children: [
        CircleAvatar(child: Icon(Icons.verified_user, size: 30, color: Colors.white,), radius: 40, backgroundColor: secondaryTheme,),
        SizedBox(height: 10),
        Text("Personal Details"),
      ],
  ),
    ),);
}