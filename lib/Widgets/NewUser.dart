import 'package:flutter/material.dart';

class NewUser {
  String name;
  String username;
  String password;
  String email;
  String carMake;
  String carModel;

  NewUser(
      {this.name,
      this.username,
      this.email,
      this.password,
      this.carMake,
      this.carModel});
}
