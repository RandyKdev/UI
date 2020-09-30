import 'package:flutter/material.dart';

class Tables extends StatelessWidget {
  // Tables({column})
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Id', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('Name', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('id', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('Name', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('id', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('Name', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('id', style: TextStyle(fontSize: 17,),),),
        DataColumn(label: Text('Name', style: TextStyle(fontSize: 17,),),),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
          DataCell(Text('1'),),
          DataCell(Text('Randy'),),
        ],),
      ],
    );
    Table(
      
      defaultColumnWidth: FlexColumnWidth(100),
      children: [
      TableRow(children: [
        Text('Perwson'),
        Text('Perwson2'),
        Text('Perwson3'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
      ],),
      TableRow(children: [
        Text('Perwson'),
        Text('Perwson2'),
        Text('Perwson3'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
        Text('Perwson'),
      ],),
    ],
    );
  }  
}