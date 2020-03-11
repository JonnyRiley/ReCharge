import 'package:flutter/material.dart';
import './MainHeader.dart';
import './RegisterForm.dart';
import './UserHomePage.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: Form(
          autovalidate: true,
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.length < 2) {
                    return 'Username not long enough';
                  }
                },
                onSaved: (value) => username = value,
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
                onSaved: (value) => password = value,
              ),
              new FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterForm()));
                  },
                  child: Text("Need an account? Register here")),
            ]),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserHomePage()));
          }
        },
        label: Text('Log In'),
      ),
    );
  }
}
