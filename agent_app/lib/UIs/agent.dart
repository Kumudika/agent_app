import 'dart:ui';

import 'package:agentapp/Componets/basic_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Agent extends StatefulWidget {
  @override
  AgentState createState() {
    return AgentState();
  }
}

class AgentState extends State<Agent> {
  bool _businessVisible = false;
  bool _individualVisible = true;
  var width;
  String text =
      "Choose this option if you are using this as an personal receptionist.";

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    width = (width - 90) / 2;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/img/icon.png',
                    height: 45,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Your Agent",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: "OpenSansBold",
                        color: Color(0xff393E57)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Choose Your First Agent",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "OpenSansRegular",
                        color: Color(0xff939AB1)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        onCardTap(1);
                      },
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: _individualVisible ? 10.0 : 0,
                        child: Opacity(
                          opacity: _individualVisible ? 1 : 0.2,
                          child: Container(
                            decoration: new BoxDecoration(
                                color: _individualVisible
                                    ? Colors.white
                                    : Colors.grey,
                                borderRadius: new BorderRadius.all(
                                    Radius.circular(5.0))),
                            width: width,
                            height: width * 1.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getTickImage(1),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/img/business.png',
                                      height: 60,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Individual",
                                    style: TextStyle(
                                        color: Color(0xff29B9FF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        onCardTap(2);
                      },
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: _businessVisible ? 10.0 : 0,
                        child: Opacity(
                          opacity: _businessVisible ? 1 : 0.2,
                          child: Container(
                            decoration: new BoxDecoration(
                                color: _businessVisible
                                    ? Colors.white
                                    : Colors.grey,
                                borderRadius: new BorderRadius.all(
                                    Radius.circular(5.0))),
                            width: width,
                            height: width * 1.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                getTickImage(2),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/img/business.png',
                                      height: 60,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Business",
                                    style: TextStyle(
                                        color: Color(0xff29B9FF),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xfff4fbff),
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Color(0xff3ec0ff),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color(0xff151515), fontSize: 15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: customFillButton("Continue", null),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/img/back.png',
                          height: 14,
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          width: 8,
                        ),
                        Text(
                          "BACK",
                          style: TextStyle(
                              color: Color(0xff6E768A),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCardTap(int val) {
    if (val == 1) {
      setState(() {
        _individualVisible = true;
        _businessVisible = false;
        text =
            "Choose this option if you are using this as an personal receptionist.";
      });
    } else {
      setState(() {
        _businessVisible = true;
        _individualVisible = false;
        text =
            "Choose this option if you are using this to represent your own business.";
      });
    }
  }

  Widget getTickImage(int val) {
    if(val == 1 && _individualVisible) {
      return Padding(
        padding: EdgeInsets.only(right: 8, top: 8),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/img/tick.png',
            height: 22,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    } else if(val == 2 && _businessVisible) {
      return Padding(
        padding: EdgeInsets.only(right: 8, top: 8),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/img/tick.png',
            height: 22,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 8),
      );
    }
  }
}
