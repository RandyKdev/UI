import 'package:flutter/material.dart';
import './utils/table.dart';
import './utils/createTableHeadings.dart';

class ApplicationFeePayment {
  int amount, momoNumber, referenceNumber;
  dynamic bankReceipt;

  ApplicationFeePayment({
    this.amount,
    this.momoNumber,
    this.bankReceipt,
    this.referenceNumber,
  });

  Future<ModelTable> getTable() async {
    List<DataRow> rows = await _getTableBody();
    List<DataColumn> columns = _getTableHeadings();
    return ModelTable(columns: columns, rows: rows);
  }

  List<DataColumn> _getTableHeadings() {
    List<String> heads = [
      '#',
      'Momo Number',
      'Reference Number',
      'Amount',
      'Back Receipt',
    ];
    return createTableHeadings(heads);
  }

  Future<List<DataRow>> _getTableBody() async {
    //access database
    //  return [
    //     DataRow(
    //       cells: [
    //       DataCell(Text('1'),),
    //     ],
    //     ),
      // ];
      return [DataRow()];
  }
}
