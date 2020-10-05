import 'package:flutter/material.dart';

import '../../../colorConstants.dart';

class SectionsBottomSheet extends StatelessWidget {
  SectionsBottomSheet({this.changePageIndex, this.headings});
  final Function changePageIndex;
  final List<String> headings;
  final List<IconData> icons = [
    Icons.apps,
    Icons.person,
    Icons.contacts,
    Icons.work,
    Icons.dashboard,
    Icons.person_add,
    Icons.file_upload,
    Icons.payment,
  ];
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: _row(context),
        ),
      ),
    );
  }

  List<Row> _row(BuildContext context) {
    List<Row> result = [];
    for (int i = 0; i < headings.length; i = i + 2) {
      result.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _rowElem(icon: icons[i], title: headings[i], index: i, context: context,),
            _rowElem(icon: icons[i + 1], title: headings[i + 1], index: i + 1, context: context,),
          ],
        ),
      );
    }
    return result;
  }

  Widget _rowElem({
    IconData icon,
    String title,
    int index,
    BuildContext context,
  }) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          changePageIndex(index);
        },
              child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
                radius: 40,
                backgroundColor: secondaryTheme,
              ),
              SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
