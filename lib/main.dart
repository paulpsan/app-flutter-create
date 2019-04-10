import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MyApp());
var imgX = "assets/images/X.jpg",imgO = "assets/images/O.jpg",imgI = "assets/images/init.jpg",turn = imgX,aG = [["", "", ""],["", "", ""],["", "", ""]];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      home: Scaffold(
        appBar: AppBar(title: Text("Tic Tac Toe")),
        body: Container(
          child: BodyWidget(),
          decoration: new BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/LaPaz1.jpg'),fit: BoxFit.cover)),),
      ),
    );
  }
}
class BodyWidget extends StatefulWidget {
  _BodyWidgetState createState() => _BodyWidgetState();
}
class _BodyWidgetState extends State<BodyWidget> {
  String _icon = imgI,_turn = imgX; Timer _timer;
  bool _win=false, _active = false;
  final _style = TextStyle(color: Colors.blueAccent, fontSize: 40);
  void _oNG() {
    setState(() {
      _icon = imgI; turn = imgX;_win = false;aG = [["", "", ""],["", "", ""],["", "", ""]];
    });
  }
  void _hTC(String value) {
    setState(() {
      _turn = turn;
    });
  }
  void _oW(String value) {
    _timer = new Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        if (value != null) 
          _win = true; _turn = value == "X" ? imgX : imgO;
      });
    });
  }
@override
  Widget build(BuildContext context) {
    return !_win? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(child: Text('Tic Tac Toe!', style: _style)),
              Column(children: <Widget> [Text('El Turno es de :', style: TextStyle(color: Colors.redAccent, fontSize: 25)),ABC(0, 0, false, _turn, _hTC, _oW)]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ABC(0, 0, true, _icon, _hTC, _oW),ABC(1, 0, true, _icon, _hTC, _oW),ABC(2, 0, true, _icon, _hTC, _oW),],),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ABC(0, 1, true, _icon, _hTC, _oW),ABC(1, 1, true, _icon, _hTC, _oW),ABC(2, 1, true, _icon, _hTC, _oW),],),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ABC(0, 2, true, _icon, _hTC, _oW),ABC(1, 2, true, _icon, _hTC, _oW),ABC(2, 2, true, _icon, _hTC, _oW),],)
                ]),
              GestureDetector(onTap: _oNG,child: RaisedButton(child: Text('New Game', style: _style))),
            ])
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(child: Text('El Ganador Es :',style: _style)),
              ABC(0, 0, false, _turn, _hTC, _oW),
              GestureDetector(onTap: _oNG,child: RaisedButton(child: Text('New Game',style: _style))),
            ]);
  }
}

class ABC extends StatefulWidget {
  bool _state;String _icon;int _c, _r;
  ValueChanged<String> cTurn,winner;
  ABC(this._c, this._r, this._state, this._icon, this.cTurn,this.winner);
  @override
  State<StatefulWidget> createState() {
    return _ABC();
  }
}

class _ABC extends State<ABC> {
  cWin(aG) {
    String result = null;var sum = aG[0][0] + aG[1][1] + aG[2][2];
    if (sum == "XXX" || sum == "OOO") 
      result = sum == "XXX" ? "X" : "O";
    sum = aG[0][2] + aG[1][1] + aG[2][0];
    if (sum == "XXX" || sum == "OOO") 
      result = sum == "XXX" ? "X" : "O";
    if (result == null) 
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
    if (result != null) 
        widget.winner(result);
  }
  void oPB() {
    setState(() {
      if (widget._state) 
        if (aG[widget._r][widget._c] == "") {
          widget._icon = turn; aG[widget._r][widget._c] = turn == imgX ? "X" : "O"; turn = turn == imgX ? imgO : imgX; widget.cTurn(turn);
        }
      cWin(aG);
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
                  image: AssetImage(widget._state? (aG[widget._r][widget._c] == ""? imgI: aG[widget._r][widget._c] == "X" ? imgX : imgO): widget._icon),fit: BoxFit.cover)),
        ),
        onPressed: oPB,
      ));
  }
}
