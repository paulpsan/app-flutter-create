import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "flutter app",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Text('Tic Tac Toe!'),
            ),
            ActionButtonStarComputer(false),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowButtonAction(),
                RowButtonAction(),
                RowButtonAction(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: null,
                  child: Text('New Game'),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
          ),
        ),
      ),
    );
  }
}

class RowButtonAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ActionButtonStarComputer(true),
        ActionButtonStarComputer(true),
        ActionButtonStarComputer(true),
      ],
    );
  }
}

class ActionButtonStarComputer extends StatefulWidget {
  bool stateButton;
  ActionButtonStarComputer(this.stateButton) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _ActionButtonStarComputer();
  }
}

class _ActionButtonStarComputer extends State<ActionButtonStarComputer> {
  bool sw = false;

  void onPressedButton() {
    setState(() {
      sw = widget.stateButton ? !this.sw : this.sw;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 75.0,
      width: 75.0,
      child: RaisedButton(
        // child:
        padding: new EdgeInsets.all(0.0),
        textColor: Colors.red,
        child: Container(
          child: Icon(
            sw ? Icons.favorite_border : Icons.favorite,
            size: 75.0,
          ),
        ),
        onPressed: onPressedButton,
      ),
    );
  }
}
// implementacion de BottomNavigatorBar
