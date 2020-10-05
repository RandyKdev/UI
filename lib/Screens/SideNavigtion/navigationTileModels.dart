import 'package:flutter/material.dart';

class NavigationTileModel {
  IconData icon;
  String title;

  NavigationTileModel({this.icon, this.title});
}

List<NavigationTileModel> navigationTiles = [
  NavigationTileModel(icon: Icons.account_circle, title: 'personal Details'),
  NavigationTileModel(icon: Icons.book, title: 'Work Experience'),
  NavigationTileModel(icon: Icons.content_paste, title: 'Qualifications'),
  NavigationTileModel(icon: Icons.account_box, title: 'Parent Details'),
  NavigationTileModel(icon: Icons.library_books, title: 'Documents '),
  NavigationTileModel(icon: Icons.content_paste, title: 'Create Application'),
  NavigationTileModel(icon: Icons.payment, title: 'Pay fees'),
  NavigationTileModel(icon: Icons.archive, title: 'Done and Submit'),
];
