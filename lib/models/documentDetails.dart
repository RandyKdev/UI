import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';
import 'package:ui/database/nameConstants.dart';

import './utils/createTableHeadings.dart';
import './utils/table.dart';

class DocumentDetails {
  String documentTitle, relatedAcademicProgram;
  dynamic document;
int id;

  DocumentDetails({
    this.id,
    @required this.relatedAcademicProgram,
    @required this.document,
    @required this.documentTitle,
  });

  
  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Document Title',
      'File',
      'Related Academic Program',
    ];
    return createTableHeadings(heads);
  }

  Future<List<DataRow>> _getTableBody() async {
    List<DocumentDetails> documents = await DBProvider.db.getAllDocumentDetails();
    List<DataRow> rows;
     if(documents.length > 0) {
       for(int i = 0; i < documents.length; i++) {
         rows.add(
           DataRow(
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
