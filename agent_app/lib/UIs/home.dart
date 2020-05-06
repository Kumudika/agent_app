import 'package:agentapp/Componets/basic_components.dart';
import 'package:agentapp/UIs/register_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/img/icon.png',
                  width: (MediaQuery.of(context).size.width/3) - 10,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,),
              child: Text(
                "LUCEIDE AI",
                style: TextStyle(
                  color: Color(0xff63B5DF),
                  fontFamily: "Merriweather",
                  fontSize: 16
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 50,),
                      child: Text(
                        "Managing your calls has never\nbeen easier before!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9195A1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: new BoxDecoration(
                          color: Color(0xffF3F6FF),
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          customOutlineButton("Register", registerOnClick),
                          customFillButton("login", null)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void registerOnClick() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterForm(),
        ));
  }
}
