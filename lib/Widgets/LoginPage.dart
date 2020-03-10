import 'package:flutter/material.dart';
import './MainHeader.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameFilter = new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _makeFilter = new TextEditingController();
  final TextEditingController _modelFilter = new TextEditingController();
  String _username = '';
  String _email = '';
  String _password = '';
  String _carMake = '';
  String _carModel = '';
  FormType _form = FormType.login;
  //final _formKey = GlobalKey<FormState>();

  _LoginPageState() {
    _usernameFilter.addListener(_usernameListen);
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _makeFilter.addListener(_makeListen);
    _modelFilter.addListener(_modelListen);
  }

  void _usernameListen() {
    if (_usernameFilter.text.isEmpty) {
      _username = '';
    } else {
      _username = _usernameFilter.text;
    }
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = '';
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = '';
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _makeListen() {
    if (_makeFilter.text.isEmpty) {
      _carMake = '';
    } else {
      _carMake = _makeFilter.text;
    }
  }

  void _modelListen() {
    if (_makeFilter.text.isEmpty) {
      _carModel = '';
    } else {
      _carModel = _modelFilter.text;
    }
  }

  //swap between two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Container(
            child: new TextFormField(
          // validator: (_usernameFilter) {
          //   if (_usernameFilter.isEmpty) {
          //     return 'Please enter a username';
          //   } else {
          //     return _usernameFilter;
          //   }
          // },
          controller: _usernameFilter,
          decoration: new InputDecoration(labelText: 'username'),
          keyboardType: TextInputType.text,
        )),
        new Container(
            child: new TextField(
          controller: _passwordFilter,
          decoration: new InputDecoration(labelText: 'password'),
          obscureText: true,
        ))
      ],
    ));
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              onPressed: _formChange,
              child: new Text("Don't have an account? Tap here to register"),
            ),
            new FlatButton(
              onPressed: _passwordReset,
              child: new Text('Forgot Password?'),
            )
          ],
        ),
      );
    } else {
      return new Container(
          child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _makeFilter,
              decoration: new InputDecoration(labelText: 'Car Make'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _modelFilter,
              decoration: new InputDecoration(labelText: 'Car Model'),
            ),
          ),
          new RaisedButton(
            child: new Text('Create New Account'),
            onPressed: _createAccountPressed,
          ),
          new FlatButton(
            onPressed: _formChange,
            child: new Text('Have an account? Tap here to login'),
          ),
        ],
      ));
    }
  }

// These functions can self contain any user or logic required, they all have access to username and email

  void _loginPressed() {
    // if (_formKey.currentState.validate()) {
    // }
    print('The user wants to login with $_username, $_email');
  }

  void _createAccountPressed() {
    print(
        'The user wants to create an account with $_username, $_email, $_carMake, $_carModel and $_password');
  }

  void _passwordReset() {
    print('The user wants a password request sent to $_email');
  }
}
