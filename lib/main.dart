import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() => runApp(MyApp());

var imgX = "assets/images/X.jpg";
var init = "assets/images/init.jpg";
var imgO = "assets/images/O.jpg";
var arrayGame = new List.generate(3, (_) => new List(3));
var turn = imgX;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        arrayGame[i][j] = 0;
      }
    }
    // TODO: implement build
    return MaterialApp(
      title: "flutter app",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text("Tic Tac Toe"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text('Tic Tac Toe!'),
              ),
              ActionButtonStarComputer(4, 4, false, turn),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RowButtonAction(0),
                  RowButtonAction(1),
                  RowButtonAction(2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      arrayGame = new List.generate(3, (_) => new List(3));
                      print(arrayGame);
                    },
                    child: Text('New Game'),
                  ),
                ],
              )
            ],
          ),
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/LaPaz1.jpg'),
                  fit: BoxFit.cover)),
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
  int rowButton;
  RowButtonAction(this.rowButton) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ActionButtonStarComputer(0, rowButton, true, init),
        ActionButtonStarComputer(1, rowButton, true, init),
        ActionButtonStarComputer(2, rowButton, true, init),
      ],
    );
  }
}

class ActionButtonStarComputer extends StatefulWidget {
  bool stateButton;
  String iconButton;
  int colButton;
  int rowButton;
  ActionButtonStarComputer(
      this.colButton, this.rowButton, this.stateButton, this.iconButton) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActionButtonStarComputer();
  }
}

class _ActionButtonStarComputer extends State<ActionButtonStarComputer> {
  bool sw = false;
  Function deepEq = const DeepCollectionEquality().equals;
  checkWinner(arrayGame) {
    var result = null;
    var sum = arrayGame[0][0].toString() +
        arrayGame[1][1].toString() +
        arrayGame[2][2].toString();
    if (sum == "XXX" || sum == "OOO") {
      result = {
        "win": sum == "XXX" ? "X" : "O",
        "row": 0,
        "column": 0,
        "diago": 1
      };
    }
    sum = arrayGame[0][2].toString() +
        arrayGame[1][1].toString() +
        arrayGame[2][0].toString();
    if (sum == "XXX" || sum == "OOO") {
      result = {
        "win": sum == "XXX" ? "X" : "O",
        "row": 0,
        "column": 0,
        "diago": 2
      };
    }
    if (result == null) {
      for (var i = 0; i < 3; i++) {
        var sum = arrayGame[i][0].toString() +
            arrayGame[i][1].toString() +
            arrayGame[i][2].toString();
        if (sum == "XXX" || sum == "OOO") {
          result = {
            "win": sum == "XXX" ? "X" : "O",
            "row": i + 1,
            "column": 0,
            "diago": 0
          };
          break;
        }
        sum = arrayGame[0][i].toString() +
            arrayGame[1][i].toString() +
            arrayGame[2][i].toString();
        if (sum == "XXX" || sum == "OOO") {
          result = {
            "win": sum == "XXX" ? "X" : "O",
            "row": 0,
            "column": i + 1,
            "diago": 0
          };
          break;
        }
      }
    }
    return result;
  }

  void onPressedButton() {
    setState(() {
      if (widget.stateButton) {
        if (arrayGame[widget.rowButton][widget.colButton] == 0) {
          widget.iconButton = turn;
          arrayGame[widget.rowButton][widget.colButton] =
              turn == imgX ? "X" : "O";
          turn = turn == imgX ? imgO : imgX;
        }
      }
      var res = checkWinner(arrayGame);
      if (res != null) {
        print("object $res");
      }
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
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.iconButton), fit: BoxFit.cover)),
        ),
        onPressed: onPressedButton,
      ),
    );
  }
}
// implementacion de BottomNavigatorBar
