import 'package:flutter/material.dart';
import './MainHeader.dart';
import './User.dart';

class UserHomePage extends StatelessWidget {
  User user;

  UserHomePage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Text(user.name),
          Text(user.username),
          Text(user.email),
          Text(user.carMake),
          Text(user.carModel),
        ],
      )),
    );
  }
}
