import 'package:flutter/material.dart';

void main() => runApp(MyApp());
var imgX = "assets/images/X.jpg";
var init = "assets/images/init.jpg";
var imgO = "assets/images/O.jpg";
var turn = imgX;
var aG = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""]
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ABC(4, 4, false, turn),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RBA(0),
                  RBA(1),
                  RBA(2),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  init = "assets/images/init.jpg";
                },
                child: Text('New Game'),
              ),
            ],
          ),
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/LaPaz1.jpg'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class RBA extends StatelessWidget {
  int _row;
  RBA(this._row);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ABC(0, _row, true, init),
        ABC(1, _row, true, init),
        ABC(2, _row, true, init),
      ],
    );
  }
}

class ABC extends StatefulWidget {
  bool _state;
  String _icon;
  int _col, _row;
  ABC(this._col, this._row, this._state, this._icon);
  @override
  State<StatefulWidget> createState() {
    return _ABC();
  }
}

class _ABC extends State<ABC> {
  bool sw = false;
  checkWinner(aG) {
    var result = null;
    var sum = aG[0][0] + aG[1][1] + aG[2][2];
    if (sum == "XXX" || sum == "OOO") {
      result = {
        "win": sum == "XXX" ? "X" : "O",
        "row": 0,
        "column": 0,
        "diago": 1
      };
    }
    sum = aG[0][2] + aG[1][1] + aG[2][0];
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
        var sum = aG[i][0] + aG[i][1] + aG[i][2];
        if (sum == "XXX" || sum == "OOO") {
          result = {
            "win": sum == "XXX" ? "X" : "O",
            "row": i + 1,
            "column": 0,
            "diago": 0
          };
          break;
        }
        sum = aG[0][i] + aG[1][i] + aG[2][i];
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
      if (widget._state) {
        if (aG[widget._row][widget._col] == "") {
          widget._icon = turn;
          aG[widget._row][widget._col] = turn == imgX ? "X" : "O";
          turn = turn == imgX ? imgO : imgX;
        }
      }
      var res = checkWinner(aG);
      if (res != null) {
        print("object $res");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 75.0,
      width: 75.0,
      child: RaisedButton(
        padding: new EdgeInsets.all(0.0),
        textColor: Colors.red,
        child: Container(
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget._icon), fit: BoxFit.cover)),
        ),
        onPressed: onPressedButton,
      ),
    );
  }
}
