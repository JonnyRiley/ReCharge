import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  String _username = '';

  _LoginPageState() {
    _usernameFilter.addListener(_usernameListen);
  }

  void _usernameListen() {
    if (_usernameFilter.text.isEmpty) {
      _username = '';
    } else {
      _username = _usernameFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[_buildTextFields()],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Container(
            child: new TextField(
                controller: _usernameFilter,
                decoration: new InputDecoration(labelText: 'username')))
      ],
    ));
  }
}
