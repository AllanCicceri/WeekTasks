import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:todoapp/home.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[200],
        colorScheme: ColorScheme.fromSwatch(accentColor: Colors.grey[850]),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[850]),
          headline2: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
          headline3: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.grey[200],
        ),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          selectedColor: Colors.grey[200],
        ),
      ),
      home: Home(),
    );
  }
}
