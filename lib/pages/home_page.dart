import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "DuckCoder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("wellcome to $days days of Flutter by $name"),
        ),
      ),
      // drawer: Drawer(),
    );
  }
}
