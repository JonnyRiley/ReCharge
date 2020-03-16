import 'package:flutter/material.dart';
import 'package:project/Widgets/UserHomePage.dart';
import './MainHeader.dart';
import './RegisterForm.dart';
import '../Requests/GetUser.dart';
import './UserHomePage.dart';
import './ErrorAlert.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<User> futureUser;

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainHeader(),
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
                  if (value.length <= 2) {
                    return "username must be at least two characters";
                  }
                },
                onSaved: (value) => username = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value.length <= 2) {
                    return 'Password must be at least two characters';
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
        backgroundColor: Colors.cyanAccent,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            futureUser = fetchUser(username);
            futureUser
                .then((user) => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserHomePage(logInUser: user)))
                    })
                .catchError(
                  (err) => showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(err),
                        content: Text("Did you type correctly?"),
                        actions: <Widget>[
                          FlatButton(
                              child: Text("Oops"),
                              onPressed: () => Navigator.of(context).pop())
                        ],
                      );
                    },
                  ),
                );
          }
        },
        label: Text('Log In', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
