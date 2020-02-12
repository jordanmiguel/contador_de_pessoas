import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if(_people < 0) {
        _infoText = "Mundo alternativo!";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Já estamos lotados";
        _people -= delta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/restaurant.jpg"),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      child: Text("+1",
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      onPressed: () => _changePeople(1)),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      child: Text("-1",
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      onPressed: () => _changePeople(-1)),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30)),
          ],
        )
      ],
    );
  }
}
