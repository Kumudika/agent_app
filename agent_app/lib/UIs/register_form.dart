import 'package:agentapp/API/api_calls.dart';
import 'package:agentapp/Componets/CustomTextFormField.dart';
import 'package:agentapp/Componets/basic_components.dart';
import 'package:agentapp/Model/User.dart';
import 'package:agentapp/UIs/mobile_verification.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:validators/validators.dart' as validator;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  var code;
  int maxLen = 10;
  var number;
  var w;
  User model = User();
  bool _isRequested = false;
  BuildContext context;
  bool _isUsernameValid = true;
  bool _isMobileValid = true;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    w = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isRequested,
        child: _buildForm(),
        color: Color(0xff393E57),
        progressIndicator: CircularProgressIndicator(),
        opacity: 0.6,
      ),
    );
  }

  Widget _buildForm() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 30, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
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
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 25, right: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hello,",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "OpenSansBold",
                      fontSize: 36,
                      color: const Color(0xff393E57)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10, left: 25, right: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your email and mobile number",
                  textAlign: TextAlign.left,
                  style: TextStyle(
//                        fontWeight: FontWeight.w200,
                      fontSize: 18,
                      fontFamily: "OpenSansRegular",
                      color: const Color(0xff939AB1)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
//                    CustomTextFormField(
//                      hintText: 'First Name',
//                      isEmail: true,
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Enter your first name';
//                        }
//                        return null;
//                      },
//                      onSaved: (String value) {
//                        model.firstName = value;
//                      },
//                    ),
//                    CustomTextFormField(
//                      hintText: 'Last Name',
//                      isEmail: true,
//                      validator: (String value) {
//                        if (value.isEmpty) {
//                          return 'Enter your last name';
//                        }
//                        return null;
//                      },
//                      onSaved: (String value) {
//                        model.firstName = value;
//                      },
//                    ),
                    Container(
                      width: 600,
//                  alignment: Alignment.topCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topCenter,
                            width: w * 0.15,
                            child: TextFormField(
                              readOnly: true,
                              showCursor: false,
                              controller: _controller,
                              onTap: () {
                                _showDialog();
                              },
                              decoration: InputDecoration(
                                hintText: '+1',
                                hintStyle: TextStyle(
                                  fontFamily: "Avenir45"
                                )
                              ),
                              validator: (String value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select a country code';
                                }
                                return null;
                              },
                              onSaved: (String value) {
//                                model.firstName = value;
                              },
                            ),
                          ),
                          Container(
                            width: w * 0.1,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            width: w * 0.75,
                            child: CustomTextFormField(
                              hintText: 'Phone number',
                              maxLength: maxLen,
                              isPhoneNumber: true,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Phone number cannot be empty';
                                } else if(_isMobileValid == false) {
                                  return 'Mobile number is already registered.\nPlease login using the username';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                number = value;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomTextFormField(
                      hintText: 'Email Address',
                      isPassword: false,
                      validator: (String value) {
                        if (!validator.isEmail(value)) {
                          return 'Please enter a valid email';
                        } else if(_isUsernameValid == false) {
                          return 'Username is already registered. Please login using the username.';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.email = value;
                      },
                    ),
//                    CustomTextFormField(
//                      hintText: 'Password',
//                      isPassword: true,
//                      validator: (String value) {
//                        if (value.length < 7) {
//                          return 'Password should be minimum 7 characters';
//                        }
//                        return null;
//                      },
//                    ),
                    Padding(
                      padding: new EdgeInsets.only(top: 20, bottom: 0),
                      child: customFillButton("Next", signUp),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: new EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 125,
                  decoration: new BoxDecoration(
                      color: Color(0xffF3F6FF),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff9195A1)
                          ),
                        ),
                      ),
                      customOutlineButton("login", null)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _isRequested = true;
      });
      model.phone = code + number;
//      model.phone = "+94707724000";
      String val = await validateUserAndPhoneNumber(model.email, model.phone);
      setState(() {
        _isRequested = false;
      });
      if(val != null) {
        if (val == "valid") {
          setState(() {
            _isRequested = true;
            _isMobileValid = true;
            _isUsernameValid = true;
            _formKey.currentState.validate();
            _formKey.currentState.validate();
          });
          int statusCode = await sendMobileVerificationCode(false, model.phone);
          print(statusCode);
          setState(() {
            _isRequested = false;
          });
          if (statusCode == 200 || statusCode == 202) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MobileVerification(),
                ));
          } else {
            customAlert(context, "There is an issue with mobile verification. Contact support");
          }
        } else if(val == "m_invalid"){
          setState(() {
            _isMobileValid = false;
            _formKey.currentState.validate();
            _isMobileValid = true;
          });
        } else if(val == "u_invalid") {
          setState(() {
            _isUsernameValid = false;
            _formKey.currentState.validate();
            _isUsernameValid = true;
          });
        }
      } else {
        customAlert(context, "There is an error please try again.");
      }
      print(val);
    }
  }

  void _showDialog() {
    showDialog(
      context: this.context,
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
                  padding: new EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 200,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: new EdgeInsets.only(top: 0, bottom: 10),
                          child: Text(
                            "Choose Country Code",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff939AB1), fontSize: 17),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text = "+61";
                                  code = "61";
                                  maxLen = 9;
                                  print(code);
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                padding:
                                    new EdgeInsets.only(left: 0, right: 10),
                                height: 150.0,
                                width: 120,
                                color: Colors.transparent,
                                child: new Container(
                                    padding: new EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 20,
                                        bottom: 10),
                                    decoration: new BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffC1C3CB),
                                          // set border color
                                          width: 1.0,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0))),
                                    child: new Center(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/img/aus_flag.png',
                                            height: 45,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Padding(
                                            padding: new EdgeInsets.only(
                                                top: 10, bottom: 20),
                                            child: Text(
                                              "Australia".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xffA6A8AF)),
                                            ),
                                          ),
                                          Text(
                                            "+61",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff393E57)),
                                          )
                                        ],
                                      ),
                                    )),
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text = "+1";
                                  code = "1";
                                  maxLen = 10;
                                  print(code);
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                padding:
                                    new EdgeInsets.only(left: 10, right: 0),
                                height: 150.0,
                                width: 120,
                                color: Colors.transparent,
                                child: new Container(
                                    padding: new EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 20,
                                        bottom: 10),
                                    decoration: new BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffC1C3CB),
                                          // set border color
                                          width: 1.0,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            const Radius.circular(10.0))),
                                    child: new Center(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/img/usa_flag.png',
                                            height: 45,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          Padding(
                                            padding: new EdgeInsets.only(
                                                top: 10, bottom: 20),
                                            child: Text(
                                              "United States".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xffA6A8AF)),
                                            ),
                                          ),
                                          Text(
                                            "+1",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff393E57)),
                                          )
                                        ],
                                      ),
                                    )),
                              ))
                        ],
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
}

//onPressed: () {
//setState(() {
//Navigator.of(context).pop();
//});
//}
