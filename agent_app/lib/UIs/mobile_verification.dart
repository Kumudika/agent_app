import 'package:agentapp/API/api_calls.dart';
import 'package:agentapp/API/global_param.dart';
import 'package:agentapp/Componets/basic_components.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'agent.dart';

class MobileVerification extends StatefulWidget {
  @override
  MobileVerificationState createState() {
    return MobileVerificationState();
  }
}

class MobileVerificationState extends State<MobileVerification> {
  bool _isRequesting = false;
  bool _isRetry = false;
  String code;
  BuildContext context;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: ModalProgressHUD(
        child: _buildVerificationForm(),
        inAsyncCall: _isRequesting,
        opacity: 0.6,
        color: Color(0xff393E57),
        progressIndicator: CircularProgressIndicator(
        ),
      ),
    );
  }

  Widget _buildVerificationForm() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 25, right: 25, top: 60, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              "Enter the 6 digit code sent\nvia SMS to your mobile",
              textAlign: TextAlign.center,
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "Enter text",
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue, width: 3.0),
                )
            ),
            obscureText: false,
            maxLength: 6,
            controller: _controller,
//              validator: (String value) {
//                if (value.isEmpty) {
//                  return 'Enter your first name';
//                }
//                return null;
//              },
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: FlatButton(
                  padding: new EdgeInsets.only(top: 15, bottom: 15),
                  textColor: Colors.white,
                  color: const Color(0xff38A9D9),
                  child: Text("Verify"),
                  onPressed: () {
                    this.code = _controller.text;
                    _submitCode();
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    code = _controller.text;
                    _resendCode();
                  },
                  padding: new EdgeInsets.only(top: 15, bottom: 15),
                  child: Text("Resend",
                      style: TextStyle(color: const Color(0xff38A9D9))),
                  textColor: const Color(0xff38A9D9),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: const Color(0xff38A9D9),
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _resendCode() async {
    setState(() {
      _isRequesting = true;
    });
    int statusCode = await sendMobileVerificationCode(true, GlobalParam.phone);
    setState(() {
      _isRequesting = false;
    });
    switch (statusCode) {
      case 200:
      case 202:
        customAlert(context, "Mobile number successfully activated.");
        break;
      case 400:
        customAlert(
            context, "The mobile verification code is invalid or expired.");
        break;
      default:
        customAlert(context, "There is an error in mobile verification.");
    }
  }

  Future<void> _submitCode() async {
    setState(() {
      _isRequesting = true;
    });
    String x = _controller.text;
    String val = _controller.text.toString();
    int statusCode = await submitVerificationCode(code);
    setState(() {
      _isRequesting = false;
    });
    if (statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Agent(),
          ));
//      customAlert(context, "Mobile number successfully activated.");
    } else {
      customAlert(context, "Mobile verification failed.");
      //error message alert
    }
  }

}