import 'package:flutter/material.dart';
import 'package:ui/database/nameConstants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file/file.dart';
import 'dart:io';
import 'dart:async';
import '../../../colorConstants.dart';

class Documents extends StatelessWidget {
  final documentDetailsKey = GlobalKey<FormState>();
  final documentTitleFocus = FocusNode();
  final relatedAcademicProgramFocus = FocusNode();
  final documentTitleController = TextEditingController();
  final relatedAcademicProgramController = TextEditingController();
final name = 'None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    bottomOpacity: 5.7,
    elevation: 10,
    title: Text(
      'New Document',
      style: TextStyle(color: Colors.white),
    ),
  ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: documentDetailsKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Document Details",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 35),
              TextFormField(
                controller: documentTitleController,
                focusNode: documentTitleFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(relatedAcademicProgramFocus);
                },
                validator: (documentTitle) {
                  documentTitle = documentTitle.trim();
                  if (documentTitle.length < 1) {
                    return 'Please  enter a document title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Document Title',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 35),
              TextFormField(
                focusNode: relatedAcademicProgramFocus,
                controller: relatedAcademicProgramController,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                validator: (relatedAcademicProgram) {
                  relatedAcademicProgram = relatedAcademicProgram.trim();
                  if (relatedAcademicProgram.length < 1)
                    return 'Enter a related academic program';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Related Academic Program',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Document: $name"),
                  RaisedButton(
                    child: Text("Upload"),
                    onPressed: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        //  new File().readAsString();
                        print(result.files.single.bytes);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 55),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: purple,
                onPressed: () {
                  if (documentDetailsKey.currentState.validate()) {
                    print("document title: ${documentTitleController.text}");
                    print(
                        "related academic program: ${relatedAcademicProgramController.text}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
