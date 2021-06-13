import 'package:flutter/material.dart';
import 'package:tictactoe/views/appview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic tac toe",
      home: AppView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
