import 'package:flutter/material.dart';

List<DataColumn> createTableHeadings(List<String> heads) {
  List<DataColumn> result;
  for (int i = 0; i < heads.length; i++) {
      result.add(
        DataColumn(
          label: Text(
            heads[i],
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      );
    }
    return result;
}