import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter app",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("Tic Tac Toe"),
        ),
        body: Text(
          'Hola, Mundo ! Lorem ipsum',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontFamily: "Handlee",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
    );
  }

}
