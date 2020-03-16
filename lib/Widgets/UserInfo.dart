import 'package:flutter/material.dart';
import 'package:project/Requests/getUser.dart';
import '../Requests/UserFetch.dart';
import './MainHeader.dart';

class UserInfo extends StatelessWidget {
  String username = 'Mercy';
  @override
  UserInfo(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('User Profile'),
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          fetchUserInfo(username).then((onValue) => "${onValue.name}");
        }),
      ),
    );
  }
}
