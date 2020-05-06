import 'dart:convert';
import 'dart:io';

import 'package:agentapp/API/global_param.dart';
import 'package:agentapp/API/request.dart';
import 'package:http/http.dart';

registerUser() {
  makePostRequest("register");
}

Future<String> validateUserAndPhoneNumber(String username, String number) async {
  String prefix = '/validation';
  Map map = {'mobileNumber': "+"+number, 'username': username};
  HttpClientResponse response = await apiRequestPost(prefix, map);
  if (response != null) {
    print(response);
    int code = response.statusCode;
    if (code == 200) {
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      Map<String, dynamic> data = json.decode(reply);
      if (data.remove("mobileNumberValid")) {
        if (data.remove("usernameValid")) {
          GlobalParam.phone = number;
          GlobalParam.username = username;
          return "valid";
        } else {
          return "u_invalid";
        }
      } else {
        return "m_invalid";
      }
    } else {
      return null;
    }
  }
}

Future<int> sendMobileVerificationCode(bool val, String number) async {
  //number = "%2B" + number;
  number = "%2B94703365750";
  val = true;

  String prefix = "/activation/mobile-number/$number";
  String isRetry = "false";
  if (val) isRetry = "true";
  var params = {"isRetry": isRetry};
  Response response = await apiRequestGet(prefix, params);
  return response.statusCode;
}

Future<int> submitVerificationCode(String code) async {
  String number = "%2B94703365750";
  //String number = "%2B" + GlobalParam.phone;

  String prefix = "/activation/mobile-number/$number" + "/code/" + code + "";
  Response response = await apiRequestGet(prefix, null);
  return response.statusCode;
}
