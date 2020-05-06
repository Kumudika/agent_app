import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customiseAppBar(BuildContext context) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0.0,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.blueGrey),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      "Contact Us",
      style: TextStyle(color: Colors.blueGrey),
    ),
    centerTitle: true,
  );
}

Widget customOutlineButton(String text, VoidCallback onPressedMethod) {
  return Container(
    width: double.infinity,
    child: FlatButton(
      onPressed: () {
        onPressedMethod();
      },
      padding: new EdgeInsets.only(top: 17, bottom: 17),
      child: Text(text.toUpperCase(),
          style: TextStyle(
              color: const Color(0xff38A9D9),
            fontFamily: "Avenir65",
            fontSize: 16
          )),
      textColor: const Color(0xff38A9D9),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: const Color(0xff38A9D9),
              width: 1,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15)),
    ),
  );
}

Widget customFillButton(String text, VoidCallback onPressedMethod) {
  return Container(
    width: double.infinity,
    child: FlatButton(
      padding: new EdgeInsets.only(top: 17, bottom: 17),
      textColor: Colors.white,
      color: const Color(0xff38A9D9),
      child: Text(text.toUpperCase(),
      style: TextStyle(
          fontFamily: "Avenir65",
        fontSize: 16
      ),),
      onPressed: () {
        onPressedMethod();
      },
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(15.0),
      ),
    ),
  );
}

Widget customTextField(String label, int lines) {
  return TextFormField(
    maxLines: lines,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
          color: const Color(0xff9195A1), fontSize: 14),
    ),
  );
}

void customAlert(BuildContext buildContext, String msg) {
  showDialog(
    context: buildContext,
    builder: (context) {
      return StatefulBuilder(
        // StatefulBuilder
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            actions: <Widget>[
              Container(
                padding: new EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width - 20,
                height: 120,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(top: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          msg,
                          style: TextStyle(
                            color: Color(0xff939AB1),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xff939AB1),
                      padding: new EdgeInsets.only(top: 5, bottom: 5),
                      child: Text("Ok",
                          style: TextStyle(color: Colors.white)),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color(0xff939AB1),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
//                  decoration: new BoxDecoration(
//                      color: Colors.black,
//                      borderRadius: new BorderRadius.all(
//                          const Radius.circular(40.0)
//                      )
//                  ),
              )
            ],
          );
        },
      );
    },
  );
}
