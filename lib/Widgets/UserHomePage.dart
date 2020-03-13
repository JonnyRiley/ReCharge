import 'package:flutter/material.dart';
import './MainHeader.dart';
import './NewUser.dart';
import './LoginForm.dart';
import '../Requests/GetUser.dart';

class UserHomePage extends StatelessWidget {
  NewUser user;
  User logInUser;
  UserHomePage({this.user, this.logInUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[Text('Welcome ${logInUser.name}')],
      )),
    );
  }
}
