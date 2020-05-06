import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;

  User({this.firstName, this.lastName, this.email, this.password, this.phone});
}


class Result extends StatelessWidget {
  User model;
  Result({this.model});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.firstName, style: TextStyle(fontSize: 22)),
            Text(model.lastName, style: TextStyle(fontSize: 22)),
            Text(model.email, style: TextStyle(fontSize: 22)),
            Text(model.password, style: TextStyle(fontSize: 22)),
            Text(model.phone, style: TextStyle(fontSize: 22),)
          ],
        ),
      ),
    ));
  }
}