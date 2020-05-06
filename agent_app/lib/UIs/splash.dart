import 'package:agentapp/UIs/agent.dart';
import 'package:agentapp/UIs/register_form.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/img/icon.png',
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}