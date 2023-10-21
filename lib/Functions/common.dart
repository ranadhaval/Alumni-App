// ignore_for_file: empty_catches, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// import '../Constants/url_constants.dart';
import '../main.dart';

bool isEmailValid(String text) {
  String validString =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp red = RegExp(validString);

  return red.hasMatch(text);
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

List<TextEditingController> getTextController(int count) {
  return List.generate(count, (index) => TextEditingController());
}

void showToast(String message) {
  Fluttertoast.showToast(msg: message);
}

void navigateToPageReplaceMent(var newPage) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => newPage,
      ),
      (route) => false);
}

void navigateToPageReplaceMentNamed(String newPage) {
  Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!, newPage, (route) => false);
}

void navigateToPageWithoutReplaceMent(var newPage) {
  Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => newPage,
      ));
}

void navigateToPageWithoutReplaceMentNamed(var newPage) {
  Navigator.pushNamed(navigatorKey.currentContext!, newPage);
}

Future<String> uploadImageFunction(File? image) async {
  if (image != null) {
    String uploadImageUrl = "";
    var request = http.MultipartRequest('POST', Uri.parse(uploadImageUrl));
    request.fields.addAll({'fileType': "image", 'documentSize': '10000'});
    request.files.add(await http.MultipartFile.fromPath('file', image.path));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data)['name'];
    }
  }
  return "";
}

directToScreenAccordingToNotification(String title) {
  //
  //TODO
  var page = "";
  try {
    navigatorKey.currentState!.pushNamed(page);
  } catch (e) {}
}

String parseString(String name, int count) {
  return name.length > count ? "${name.substring(0, count - 1)} ..." : name;
}

bool checkDate(DateTime d1, DateTime d2) {
  return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
}

bool checkDateIsAfter(DateTime d2) {
  DateTime d1 = DateTime.now();

  return d1.isAfter(d2);
}

BorderRadius getBorderRadiusTop(double radius) {
  return BorderRadius.only(
      topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
}

BorderRadius getBorderRadiusAll(double radius) {
  return BorderRadius.circular(radius);
}

ShapeBorder cardShapeBorder(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

ShapeBorder cardShapeBorderTop(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
}

ShapeBorder cardShapeBorderBottom(double radius) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(radius),
          bottomLeft: Radius.circular(radius)));
}

BoxDecoration getBoxDecorationTop(double radius, Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)));
}

BoxDecoration getBoxDecorationAll(double radius, Color color) {
  return BoxDecoration(
      color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
}

BoxDecoration getBoxDecorationWithBorder(
    double radius, Color color, Color borderColor) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: borderColor));
}

//used velocityx
// String parseDoubleString(double value) {
//   return value.toDoubleStringAsPrecised(length: 2);
// }

String getPriceParsed(double price) {
  return price.toString();
}

Future<String?> getOwnToken() async {
  // return await FirebaseMessaging.instance.getToken();
  return "";
}

//function to update or create notification push token
updateTokenNotification() async {
  // TODO
  // String? token = await getOwnToken();
  // bool resp = await AuthController.instance.updateField({"id": SharedHelper.id, "token": token!});
  // if (resp) {
  //   UserModel model = SharedHelper.userModel!;
  //   model.token = token;
  //   SharedHelper.userModel = model;
  //   await SharedPrefData.setModelDetails(model.toMap(), SharedPrefKeys.userDetailKey);
  // }
}
