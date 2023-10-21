import 'package:flutter/material.dart';
import '../main.dart';

class AppColors {
  static List<Color> lightColors = const [
    Color(0xff52366C), //primary color
    Color(0xffFFF6EC), //primary lint color
    Color(0xffFFE6C8), //background
    Color(0xffFFF6EC), //textFieldBackground
    Color(0xffE2C2A7), //borderColorTextField
    Color(0xFF6D6D6D), //textColorTextField
    Color(0xFF646979), //subHeading
    Color(0xFFFF9C5B), //secondaryColor
    Color(0xFF1C2227), //invert
    Color(0xff89CA12), //lightGreen
    Color.fromRGBO(229, 231, 235, 1), //gray200
    Color.fromARGB(255, 91, 91, 91), //shadow
    Colors.white, //white
    Color(0xFFF9761C), //orange
    Color(0xFFFFA101), //yellow
    Color(0xFFF1604E), //red
    Color(0xFFF0FFE8), //location background
    Color(0xFFC0BCB9), //stroke
    Colors.black, //black
    Colors.grey,
    Color.fromARGB(255, 252, 180, 132), // secondaryColor Appbar
    Color.fromARGB(255, 123, 102, 143), // primaryColor Appbar
    Colors.transparent, // transperent color

    Color.fromRGBO(248, 248, 248, 1), // form body color
    Color.fromRGBO(237, 237, 237, 1), // form appbar color
    Color.fromRGBO(
        244, 244, 244, 0.5) // country AND city dropdown  backgroundcolor
  ];
  static List<Color> darkColors = const [
    Color(0xff52366C), //primary color
    Color(0xffFFF6EC), //primary lint color
    Color(0xffFFE6C8), //background
    Color(0xffFFF6EC), //textFieldBackground
    Color(0xffE2C2A7), //borderColorTextField
    Color(0xFF80868B), //textColorTextField
    Color(0xFF646979), //subHeading
    Color(0xFFFF9C5B), //secondaryColor
    Color(0xFFffffff), //invert
    Color(0xff89CA12), //lightGreen
    Color.fromRGBO(229, 231, 235, 1), //gray200
    Color.fromARGB(255, 35, 35, 35), //shadow
    Colors.white, //white
    Color(0xFFF9761C), //orange
    Color(0xFFFFA101), //yellow
    Color(0xFFF1604E), //red
    Color(0xFFF0FFE8), //location background
    Color(0xFFC0BCB9), //stroke
    Colors.black, //black
    Colors.grey,
    Color.fromARGB(255, 252, 180, 132), // secondaryColor Appbar
    Color.fromARGB(255, 123, 102, 143), // primaryColor Appbar
    Colors.transparent, // transperent color

    Color.fromRGBO(248, 248, 248, 1), // form body color
    Color.fromRGBO(237, 237, 237, 1), // form appbar color
        Color.fromRGBO(
        244, 244, 244, 0.5) // country AND city dropdown  backgroundcolor
  ];

  //function to get any color with light dark theme
  static Color getColor(AppColorsEnum color) {
    return (Theme.of(navigatorKey.currentContext!).brightness) ==
            Brightness.light
        ? lightColors[color.index]
        : darkColors[color.index];
  }

  //function to get single color
  static Color getSingleColor(AppColorsEnum color, {bool isDark = false}) {
    return isDark ? darkColors[color.index] : lightColors[color.index];
  }
}

enum AppColorsEnum {
  primary,
  lintColor,
  background,
  textFieldBackground,
  borderColorTextField,
  textColorTextField,
  subHeading,
  secondaryColor,
  invert,
  lightGreen,
  gray200,
  shadow,
  white,
  orange,
  yellow,
  red,
  locationBackground,
  stroke,
  black,
  grey,
  secondaryColorAppbar,
  primaryColorAppbar,
  transparentColor,
  formBodyColor,
  formAppBarColor,
  cityAndCountryFeildColor
}
