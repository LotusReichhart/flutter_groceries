import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  // static final NavigationService navigationService =
  // locator<NavigationService>();

  static Map userPayload = {};

  static void post(Map<String, dynamic> parameter, String path,
      {bool isToken = false, ResSuccess? withSuccess, ResFailure? failure}) {
    Future(() {
      // try {
      //   var headers = {
      //     "Content-Type": "application/x-www-form-urlencoded",
      //   };
      //   http.post(
      //     Uri.parse(path),
      //     headers: headers,
      //     body: parameter,
      //   ).then((response) {
      //     if (kDebugMode) {
      //       print(response.body);
      //     }
      //     try {
      //       var jsonObj = json.decode(response.body) as Map<String, dynamic>? ??
      //           {};
      //       if (withSuccess != null) withSuccess(jsonObj);
      //     } catch (err) {
      //       if (failure != null) failure(err.toString());
      //     }
      //   }).catchError((error) {
      //     failure?.call(error);
      //   });
      // }
    });
  }
}