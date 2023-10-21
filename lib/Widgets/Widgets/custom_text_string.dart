// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';

import '../../themeFiles/app_colors.dart';

class CustomTextString extends StatelessWidget {
  String text;
  bool bold;
  Color? color = AppColors.getColor(AppColorsEnum.invert);
  TextAlign textAlign;
  double size;
  bool capatilize;
  bool showLine;
  bool underLine;
  TextStyle? style;
  CustomTextString({
    Key? key,
    required this.text,
    this.bold = false,
    this.capatilize = false,
    this.size = 14,
    this.color,
    this.textAlign = TextAlign.left,
    this.showLine = false,
    this.underLine = false,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style2 = TextStyle(
      decoration: showLine
          ? TextDecoration.lineThrough
          : underLine
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: size,
    );

    if (style != null) {
      style2 = style;
    }
    return capatilize
        ? Text(
             text.toUpperCase(),
            textAlign: textAlign,
            style: style2!.copyWith(
              color: color,
            ),
          )
        :  Text(
              text,
            textAlign: textAlign,
            style: style2!.copyWith(
              color: color,
            ),
          );
  }
}
