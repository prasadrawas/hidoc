// import 'dart:convert';
//
// import 'package:login_task/core/model/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AppPreference {
//   static final AppPreference _appPreference = AppPreference._internal();
//
//   factory AppPreference() {
//     return _appPreference;
//   }
//
//   AppPreference._internal();
//
//   static late SharedPreferences _preferences;
//
//   static const String isLogged = 'is_logged';
//   static const String userJson = 'user';
//
//   static Future<void> initialAppPreference() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static Future clear() async {
//     await _preferences.clear();
//   }
//
//   static Future<void> setLoggedIn(bool value) async {
//     await _preferences.setBool(isLogged, value);
//   }
//
//   static bool getLoggedIn() {
//     return _preferences.getBool(isLogged) ?? false;
//   }
//
//   static User? getUser() {
//     var json = jsonDecode(_preferences.getString(userJson) ?? "");
//     if (json == '') {
//       return null;
//     } else {
//       User? payload = User.fromJson(json);
//       return payload;
//     }
//   }
//
//   static Future<void> setUser(User user) async {
//     String userData = jsonEncode(user.toJson());
//     await _preferences.setString(userJson, userData);
//   }
// }
