// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;
  static late Map<String, String> languageMap;

  //initilizate sharedpreference
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //function to get a string
  static String getString(SharedPrefKeys key) {
    return sharedPreferences.getString(key.name) ?? "en";
  }

  //function to store a string
  static Future<bool> setString(SharedPrefKeys key, String value) async {
    return await sharedPreferences.setString(key.name, value);
  }
}

enum SharedPrefKeys { languageKey }
