import 'package:flutter/material.dart';
// import 'package:my_first_program/pages/home_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        //  primaryTextTheme: GoogleFonts.laterTextThem()
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        // "/login": (context) => LoginPage()
      },
    );
  }
}
