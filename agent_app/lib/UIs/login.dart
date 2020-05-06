import 'package:agentapp/Componets/basic_components.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customiseAppBar(context),
      body: Center(
        child: FlatButton(
          onPressed: () {
            customAlert(context, "Here is the custom alert message.");
          },
        ),
      ),
    );
  }
  
}