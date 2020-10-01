import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';

import './utils/createTableHeadings.dart';
import './utils/table.dart';

class DocumentDetails {
  String documentTitle, relatedAcademicProgram;
  dynamic document;
int id;

  DocumentDetails({
    this.id,
    this.relatedAcademicProgram,
    this.document,
    this.documentTitle,
  });

  List<String> heads = [
      '#',
      'Document Title',
      'File',
      'Related Academic Program',
    ];

List<DataRow> makeEmptyRow() {
   List<DataCell> emptyCells = [];
   for(int i = 0; i < heads.length; i++) {
     emptyCells.add(
       DataCell(Text(''))
     );
   }
   return [DataRow(cells: emptyCells)];
 }

  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    if(rows == null) rows = makeEmptyRow();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() => createTableHeadings(heads);

  Future<List<DataRow>> _getTableBody() async {
    List<DocumentDetails> documents = await DBProvider.db.getAllDocumentDetails();
    List<DataRow> rows = [];
     if(documents != null && documents.length > 0) {
       for(int i = 0; i < documents.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
          cells: [
          DataCell(Text(documents[i].id.toString()),),
          DataCell(Text(documents[i].documentTitle),),
          DataCell(Text(documents[i].document.toString()),),
          DataCell(Text(documents[i].relatedAcademicProgram),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
