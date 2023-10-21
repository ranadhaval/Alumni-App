import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar appBar({required Color color}) => AppBar(
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, statusBarColor: color),
    );
