import 'package:flutter/material.dart';


import 'package:ui/models/utils/table.dart';
import 'package:ui/models/applicationDetails.dart';
import 'package:ui/models/applicationFeePayment.dart';
import 'package:ui/models/contactDetails.dart';
import 'package:ui/models/documentDetails.dart';
import 'package:ui/models/parentDetails.dart';
import 'package:ui/models/personalInformation.dart';
import 'package:ui/models/qualificationDetails.dart';
import 'package:ui/models/workDetails.dart';

class HomeBody extends StatefulWidget {
  HomeBody(this.pageIndex);
  final int pageIndex;
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Widget body = Container();
   @override
  void initState() {
    super.initState();
    _showTable().then((value) => setState(() => body = value ?? Container()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showTable().then((value) => setState(() => body = value ?? Container()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: body,
          ),
      );
  }

  Future<ModelTable> _showTable() async {
    switch (widget.pageIndex) {
      case 0:
        ApplicationDetails tab = ApplicationDetails();
        return await tab.getTable();
        break;
      case 1:
        PersonalInformation tab = PersonalInformation();
        return tab.getTable();
        break;
      case 2:
        ContactDetails tab = ContactDetails();
        return tab.getTable();
        break;
      case 3:
        WorkDetails tab = WorkDetails();
        return tab.getTable();
        break;
      case 4:
        QualificationDetails tab = QualificationDetails();
        return tab.getTable();
        break;
      case 5:
        ParentDetails tab = ParentDetails();
        return tab.getTable();
        break;
      case 6:
        DocumentDetails tab = DocumentDetails();
        return tab.getTable();
        break;
      case 7:
        ApplicationFeePayment tab = ApplicationFeePayment();
        return tab.getTable();
        break;
      default:
        return null;
    }
  }
}