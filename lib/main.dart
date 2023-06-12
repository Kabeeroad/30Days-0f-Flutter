import 'package:flutter/material.dart';
// import 'package:my_first_program/pages/home_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'uitltis/routs.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // debugShowCheckedModeBanner: false, //? remove debug bener on app bar
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => HomePage(),
        MyRoutes.loginRoutes: (context) => LoginPage()
      },
    );
  }
}
