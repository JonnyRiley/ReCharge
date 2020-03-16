import 'package:flutter/material.dart';

class MainHeader extends AppBar {
  MainHeader({
    Key key,
    Widget title,
    Color backgroundColor,
    PreferredSizeWidget bottom,
  }) : super(
            key: key,
            title: Text('reCharge',
                style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[Colors.pinkAccent, Colors.purpleAccent],
                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)))),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.offline_bolt),
                  iconSize: 45,
                  color: Colors.cyanAccent,
                  onPressed: () => print('hola'))
            ],
            backgroundColor: Colors.black);
}
