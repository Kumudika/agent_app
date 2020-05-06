import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

makePostRequest(String prefix) async {
  // set up POST request arguments
  String url =
      'http://tf-lb-20200121114924975800000001-279828401.us-east-1.elb.amazonaws.com:8080/v1/users';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"businessName": "12", "countryCode": "+1", "firstName": "abc", "lastName": "efg",'
  ' "mobileNumber": "753345850", "password": "1234", "preferredName": "kkk", "role": "admin", "username": "abc"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
}

makeGetRequest(String prefix) async {
  // set up POST request arguments
  String url =
      'http://tf-lb-20200121114924975800000001-279828401.us-east-1.elb.amazonaws.com:8080/v1/users';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"businessName": "12", "countryCode": "+1", "firstName": "abc", "lastName": "efg",'
      ' "mobileNumber": "753345850", "password": "1234", "preferredName": "kkk", "role": "admin", "username": "abc"}';
  // make POST request
  Response response = await get(url, headers: headers);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
}

Future<HttpClientResponse> apiRequestPost(String prefix, Map jsonMap) async {
  String url = 'http://tf-lb-20200121114924975800000001-279828401.us-east-1.elb.amazonaws.com:8080/v1/users';
  url = url + prefix;
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  return response;
  // todo - you should check the response.statusCode
//  int code = response.statusCode;
//  String reply;
//  if(code == 200) {
//    reply = await response.transform(utf8.decoder).join();
//    print(reply);
//    Map<String, dynamic> data = json.decode(reply);
//    if(data.remove("mobileNumberValid")) {
//      if(data.remove("usernameValid")) {
//
//      } else {
//
//      }
//    } else {
//
//    }
//  }
//  httpClient.close();
//  return reply;
}

Future<Response> apiRequestGet(String prefix, var params) async {
  String url = "http://tf-lb-20200121114924975800000001-279828401.us-east-1.elb.amazonaws.com:8080/v1/users";
  url = url + prefix;
  Uri uri = Uri.parse(url);
  final newURI = uri.replace(queryParameters: params);
  Map<String, String> headers = {"Accept-Encoding": "gzip, deflate"};
  Response response = await get(newURI, headers: headers);
  return response;
//  String reply = response.body;
//  return reply;
}
