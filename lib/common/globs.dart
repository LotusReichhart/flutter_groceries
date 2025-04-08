import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_groceries/main.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

class Globs {
  static const appName = "Flutter Groceries";

  static const userPayload = "user_payload";
  static const userLogin = "user_login";

  static void showHUD({String status = "loading ....."}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    EasyLoading.show(status: status);
  }

  static void hideHUD() async {
    EasyLoading.dismiss();
  }

  static void udSet(dynamic data, String key) {
    var jsonStr = json.encode(data);
    prefs?.setString(key, jsonStr);
  }

  static void udStringSet(dynamic data, String key) {
    prefs?.setString(key, data);
  }

  static void udBoolSet(dynamic data, String key) {
    prefs?.setBool(key, data);
  }

  static void udIntSet(dynamic data, String key) {
    prefs?.setInt(key, data);
  }

  static void udDoubleSet(dynamic data, String key) {
    prefs?.setDouble(key, data);
  }

  static dynamic udValue(String key) {
    return json.decode(prefs?.get(key) as String? ?? "{}");
  }

  static String udValueString(String key) {
    return prefs?.get(key) as String? ?? "";
  }

  static bool udValueBool(String key) {
    return prefs?.get(key) as bool? ?? false;
  }

  static bool udValueTrueBool(String key) {
    return prefs?.get(key) as bool? ?? true;
  }

  static int udValueInt(String key) {
    return prefs?.get(key) as int? ?? 0;
  }

  static double udValueDouble(String key) {
    return prefs?.get(key) as double? ?? 0.0;
  }

  static void udRemove(String key) {
    prefs?.remove(key);
  }

  static Future<String> timeZone() async {
    try {
      return await FlutterTimezone.getLocalTimezone();
    } on PlatformException {
      return "";
    }
  }
}

class SVKey {
  static const mainUrl = "";
  static const baseUrl = "$mainUrl/api/";
  static const nodeUrl = mainUrl;

  static const svLogin = "${baseUrl}login";
  static const svSignup = "${baseUrl}signup";
  static const svForgotPassword = "${baseUrl}forgot-password-req";
  static const svForgotPasswordVerify = "${baseUrl}forgot-password-verify";
  static const svForgotPasswordSetNew = "${baseUrl}forgot-password-set-new";
}

class KKey {
  static const payload = "payload";
  static const status = "status";
  static const message = "message";
  static const authToken = "auth-token";
  static const name = "name";
}
