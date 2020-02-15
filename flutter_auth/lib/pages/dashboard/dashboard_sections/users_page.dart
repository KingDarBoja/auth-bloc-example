import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'User Page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),
          )
        ),
      )
    );
  }
}
