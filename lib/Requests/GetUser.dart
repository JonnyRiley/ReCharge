import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> fetchUser(String username) async {
  var uri = Uri.https(
      "obscure-savannah-61382.herokuapp.com", "/users", {'username': username});

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    print(response.body);
    return User.fromJson(json.decode(response.body));
  } else {
    throw ("$username is not registered!");
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final int carId;

  User({this.id, this.name, this.username, this.email, this.carId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      carId: json['car_id'],
    );
  }
}
