import 'package:flutter/material.dart';
import './Widgets/LoginPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Surge of Energy',
      theme: new ThemeData(primarySwatch: Colors.green),
      home: new LoginPage(),
    );
  }
}
