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
/*        body: Text(
          'Hola, Mundo ! Lorem ipsum',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontFamily: "Handlee",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),

        ),*/

        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                RowButtonAction(),
                RowButtonAction(),
                RowButtonAction(),
              ],
            )
          ],
        ),

      ),
    );
  }

}

class RowButtonAction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        ActionButtonStarComputer(),
        ActionButtonStarComputer(),
        ActionButtonStarComputer(),
      ],
    );
  }

}

class ActionButtonStarComputer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _ActionButtonStarComputer();
  }

}
class _ActionButtonStarComputer extends State<ActionButtonStarComputer>{
  bool sw = false;
  void onPressedButton(){
    setState(() {
      sw=!this.sw;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FloatingActionButton(
      child: Icon(sw?Icons.favorite_border:Icons.favorite),
      backgroundColor: Colors.green,
      mini: true,
      onPressed: onPressedButton,
    );
  }
}
// implementacion de BottomNavigatorBar


