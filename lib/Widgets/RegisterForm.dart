// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project/Widgets/UserHomePage.dart';
import './MainHeader.dart';
import './LoginForm.dart';
import './User.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User user = User();

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
            decoration: const InputDecoration(labelText: 'Full Name'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter your name';
              }
              return null;
            },
            onSaved: (value) {
              user.name = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return 'Username not long enough';
              }
              return null;
            },
            onSaved: (value) {
              user.username = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value.length < 2) {
                return 'Password not long enough';
              }
              return null;
            },
            onSaved: (value) {
              user.password = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 6) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) {
              user.email = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Car Make'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return 'Input not long enough';
              }
              return null;
            },
            onSaved: (value) {
              user.carMake = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Car Model'),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.length < 2) {
                return 'Input not long enough';
              }
              return null;
            },
            onSaved: (value) {
              user.carModel = value;
            },
          ),
          new FlatButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => LoginForm()));
              },
              child: Text("Have an account? Log in here")),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserHomePage(user: this.user)));
          }
        },
        label: Text('Register'),
      ),
    );
  }
}
