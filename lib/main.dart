import 'package:flutter/material.dart';

void main() => runApp(MyApp());
var imgX = "assets/images/X.jpg";
var imgO = "assets/images/O.jpg";
var imgI = "assets/images/init.jpg";
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
          child: BodyWidget(),
          decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/LaPaz1.jpg'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  String _icon = "assets/images/init.jpg";
  String _turn = imgX;
  bool _win = false;
  bool _active = false;
  final _style = TextStyle(color: Colors.blueAccent, fontSize: 40);
  void _handleTapboxChanged() {
    setState(() {
      _icon = "assets/images/init.jpg";
      turn = imgX;
      _win = false;
      aG = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
      ];
    });
  }

  void _handleTurnChanged(String value) {
    setState(() {
      _turn = turn;
    });
  }

  void _onWinner(String value) {
    setState(() {
      print(value);
      if (value != null) {
        _win = true;
        _turn = value == "X" ? imgX : imgO;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_win
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text('Tic Tac Toe!', style: _style),
              ),
              GestureDetector(
                child: ABC(0, 0, false, _turn, _handleTurnChanged, _onWinner),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ABC(0, 0, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(1, 0, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(2, 0, true, _icon, _handleTurnChanged, _onWinner),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ABC(0, 1, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(1, 1, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(2, 1, true, _icon, _handleTurnChanged, _onWinner),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ABC(0, 2, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(1, 2, true, _icon, _handleTurnChanged, _onWinner),
                      ABC(2, 2, true, _icon, _handleTurnChanged, _onWinner),
                    ],
                  )
                ],
              ),
              GestureDetector(
                  onTap: _handleTapboxChanged,
                  child: RaisedButton(child: Text('New Game', style: _style))),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text('El Ganador Es :'),
              ),
              ABC(0, 0, false, _turn, _handleTurnChanged, _onWinner),
              GestureDetector(
                  onTap: _handleTapboxChanged,
                  child: RaisedButton(
                      child: Text(
                    'New Game',
                    style: _style,
                  ))),
            ],
          );
  }
}

class ABC extends StatefulWidget {
  bool _state;
  String _icon;
  int _col, _row;
  ValueChanged<String> changeTurn;
  ValueChanged<String> winner;
  ABC(this._col, this._row, this._state, this._icon, this.changeTurn,
      this.winner);
  @override
  State<StatefulWidget> createState() {
    return _ABC();
  }
}

class _ABC extends State<ABC> {
  bool sw = false;

  checkWinner(aG) {
    String result = null;
    var sum = aG[0][0] + aG[1][1] + aG[2][2];
    if (sum == "XXX" || sum == "OOO") {
      result = sum == "XXX" ? "X" : "O";
    }
    sum = aG[0][2] + aG[1][1] + aG[2][0];
    if (sum == "XXX" || sum == "OOO") {
      result = sum == "XXX" ? "X" : "O";
    }
    if (result == null) {
      for (var i = 0; i < 3; i++) {
        var sum = aG[i][0] + aG[i][1] + aG[i][2];
        if (sum == "XXX" || sum == "OOO") {
          result = sum == "XXX" ? "X" : "O";
          break;
        }
        sum = aG[0][i] + aG[1][i] + aG[2][i];
        if (sum == "XXX" || sum == "OOO") {
          result = sum == "XXX" ? "X" : "O";
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
          widget.changeTurn(turn);
        }
      }
      print(aG);
      String res = checkWinner(aG);
      if (res != null) {
        widget.winner(res);
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
                  image: AssetImage(widget._state
                      ? (aG[widget._row][widget._col] == ""
                          ? imgI
                          : aG[widget._row][widget._col] == "X" ? imgX : imgO)
                      : widget._icon),
                  fit: BoxFit.cover)),
        ),
        onPressed: onPressedButton,
      ),
    );
  }
}
