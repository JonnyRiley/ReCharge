import 'package:flutter/material.dart';

class User {
  String name;
  String username;
  String password;
  String email;
  String carMake;
  String carModel;

  User(
      {this.name,
      this.username,
      this.email,
      this.password,
      this.carMake,
      this.carModel});
}
