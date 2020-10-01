import 'package:flutter/material.dart';
import 'package:ui/database/dbprovider.dart';
import './utils/table.dart';
import './utils/createTableHeadings.dart';

class ApplicationFeePayment {
  int amount, id, momoNumber, referenceNumber;
  dynamic bankReceipt;

  ApplicationFeePayment({
    this.id,
    this.amount,
    this.momoNumber,
    this.bankReceipt,
    this.referenceNumber,
  });

List<String> heads = [
      '#',
      'Momo Number',
      'Reference Number',
      'Amount',
      'Back Receipt',
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
    List<ApplicationFeePayment> applicationFee = await DBProvider.db.getAllApplicationFeePayment();    //access database
      List<DataRow> rows = [];
     if(applicationFee != null && applicationFee.length > 0) {
       for(int i = 0; i < applicationFee.length; i++) {
         rows.add(
           DataRow(
             selected: i % 2 == 0,
          cells: [
          DataCell(Text(applicationFee[i].id.toString()),),
          DataCell(Text(applicationFee[i].momoNumber.toString()),),
          DataCell(Text(applicationFee[i].referenceNumber.toString()),),
          DataCell(Text(applicationFee[i].amount.toString()),),
          DataCell(Text(applicationFee[i].bankReceipt.toString()),),
        ],
        ),
         );
       }
     return rows;
     }
      return null;
  }
}
