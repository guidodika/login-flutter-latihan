import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import 'constant.dart';

class AppSharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferenceKeys.isUserLoggedIn) ?? false;
  }

  static Future<bool> setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(SharedPreferenceKeys.isUserLoggedIn, isLoggedIn);
  }
  static Future<User> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(
        json.decode(prefs.getString(SharedPreferenceKeys.user) ?? jsonEncode(User())));
  }

  static Future<bool> setUserProfile(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileJson = json.encode(user);
    return prefs.setString(SharedPreferenceKeys.user, userProfileJson);
  }
}
