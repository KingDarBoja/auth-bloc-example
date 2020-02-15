import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Home Page',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                )
              ),
              RaisedButton(
                // TODO: Provide the sign out button action!
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text("Sign out"),
                    Icon(Icons.lightbulb_outline)
                  ],
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}


