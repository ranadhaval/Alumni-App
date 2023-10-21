import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/arrays.dart';
import '../Core/shared_pref.dart';

class SharedHelper {
  static late Locale locale;
  static late Map<String, dynamic> languageMap;
  static String authToken = ""; //TODO

  //initizalize required field
  static init() async {
    await SharedPref.init();

    //fetching language from local shared data
    String code = SharedPref.getString(SharedPrefKeys.languageKey);
    locale = Locale(code);
    await loadMap();
  }


  //get selected language code
  static int getSelectedLanguage() {
    return languageCodes.indexOf(locale.languageCode);
  }

  //function to change language
  static changeLanguage(int index) async {
    String code = languageCodes[index];
    locale = Locale(code);
    await loadMap();
    SharedPref.setString(SharedPrefKeys.languageKey, code);
  }

  //get language map
  static loadMap() async {
    String jsondata = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    languageMap = jsonDecode(jsondata) as Map<String, dynamic>;
  }

  static String getTranslatedText(String key) {
    return languageMap[key] ?? key;
  }
}
