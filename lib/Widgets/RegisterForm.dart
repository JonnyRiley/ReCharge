import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import './MainHeader.dart';
import './LoginForm.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _username;
  String _password;
  String _email;
  String _carMake;
  String _carModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Chargy'),
      ),
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.length < 2) {
                  return 'input not long enough';
                }
              },
              onSaved: (value) => _name = value,
            ),
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
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }
              },
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Car Make'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.length < 2) {
                  return 'Input not long enough';
                }
              },
              onSaved: (value) => _carMake = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Car Model'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.length < 2) {
                  return 'Input not long enough';
                }
              },
              onSaved: (value) => _carModel = value,
            ),
            new FlatButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => LoginForm()));
                },
                child: Text("Have an account? Log in here")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
        },
        label: Text('Register'),
      ),
    );
  }
}
