import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  final String _splashTitle = 'Auth Example';

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container (
        color:Colors.indigo,
        child: Center (        
          child: Text(
            this._splashTitle,
            style: new TextStyle (
              color: Colors.white,
              fontSize: 16.0,
              letterSpacing: 1.0
            )
          )
        )
      )
    );
  }
}