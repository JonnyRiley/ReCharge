import 'package:flutter/material.dart';
import './Widgets/ChargePointInfoPage.dart';
import './Widgets/LoginForm.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Surge of Energy',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginForm(),
      // home: new ChargePointInfoPage(),
    );
  }
}
