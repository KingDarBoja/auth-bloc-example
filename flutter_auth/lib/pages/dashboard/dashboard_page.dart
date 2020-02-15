import 'package:flutter/material.dart';
import 'package:flip_box_bar/flip_box_bar.dart';

import 'package:flutter_auth/pages/dashboard/dashboard_sections/dashboard_sections.dart';
import 'package:flutter_auth/widgets/nav_bar/nav_bar.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int _currentIndex = 0;
  final _mainPages = [
    HomePage(),
    Scaffold(
      body: Text('Section A page')
    ),
    Scaffold(
      body: Text('Section B page')
    ),
    UsersPage(),
    Scaffold(
      body: Text('Section C page')
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: navBar(),
      body: _mainPages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(context)
    );
  }

  void _onSelectNavBar(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  FlipBoxBar _buildBottomNavigationBar(context) {
    return new FlipBoxBar (
      items: [
        FlipBarItem(
          icon: Icon(Icons.home),
          text: Text("Home"),
          frontColor: Colors.blue[900],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.business),
          text: Text("Companies"),
          frontColor: Colors.blue[800],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.directions_boat),
          text: Text("Vessels"),
          frontColor: Colors.blue[700],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.dashboard),
          text: Text("Users"),
          frontColor: Colors.blue[600],
          backColor: Colors.blueAccent
        ),
        FlipBarItem(
          icon: Icon(Icons.trending_up),
          text: Text("Reports"),
          frontColor: Colors.blue,
          backColor: Colors.blueAccent
        )
      ],
      onIndexChanged: _onSelectNavBar,
      selectedIndex: _currentIndex,
    );
  }
}