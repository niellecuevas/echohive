import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFFFBC02D),
      ),
      body: Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontFamily: 'CreatoDisplay'),
        ),
      ),
    );
  }
}
