import 'package:flutter/material.dart';
import './MainHeader.dart';
import './NewUser.dart';
import './LoginForm.dart';
import 'UserHomeMapPage.dart';
import '../Requests/GetUser.dart';

class UserHomePage extends StatelessWidget {
  // User logInUser;
  UserHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new MainHeader(
          title: new Text('Chargy'),
        ),
        body: Container(child: UserHomeMapPage())
        // child: Column(
        //   children: <Widget>[Text('Welcome')],
        // ),
        );
  }
}
