import 'package:flutter/material.dart';

class MainHeader extends AppBar {
  MainHeader({Key key, Widget title})
      : super(key: key, title: title, actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.notifications_none),
              onPressed: () => print('hello'))
        ]);
}
