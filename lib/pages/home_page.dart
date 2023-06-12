import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomePage
 extends StatelessWidget {
  final int days = 30;
  final String name = "DuckCoder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("catalog App"),
      ),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Text("wellcome to $days days of Flutter by $name"),
        ),
      ),
      // drawer: Drawer(),
    );
  }
}
