import 'package:flutter/material.dart';
import 'package:ui/colorConstants.dart';

class ModelTable extends StatelessWidget {
  ModelTable({ this.columns, this.rows });
  final List<DataColumn> columns;
  final List<DataRow> rows;
  // Tables({column})
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columns,
      rows: rows,
    );
  }  
}