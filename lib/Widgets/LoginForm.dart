import 'package:flutter/material.dart';
import './MainHeader.dart';
import './RegisterForm.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return 'Username not long enough';
              }
            },
            onSaved: (value) => _username = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value.length < 2) {
                return 'Password not long enough';
              }
            },
            onSaved: (value) => _password = value,
          ),
          new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterForm()));
              },
              child: Text("Don't have an account? Register here")),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
        },
        label: Text('Log In'),
      ),
    );
  }
}
