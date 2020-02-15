import 'package:flutter/material.dart';

AppBar navBar() {
  return AppBar (
    title: Text(
      'Auth App',
      style: TextStyle (
        color: Colors.white,
        fontSize: 20.0,
        letterSpacing: 1
      )
    ),
    actions: <Widget>[
      Padding (
        padding: EdgeInsets.all(15.0),
        child: Icon(Icons.settings, ),
      ),
      Padding (
        padding: EdgeInsets.all(15.0),
        child: Icon(Icons.person),
      )
    ],
  );
}