import 'package:flutter/material.dart';

class StyleHelper {
  static ShapeBorder cardShapeBorder(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }

  static ShapeBorder cardShapeBorderTop(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)));
  }

  static BoxDecoration getBoxDecorationTop(double radius, Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)));
  }

  static BoxDecoration getBoxDecorationAll(double radius, Color color) {
    return BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
