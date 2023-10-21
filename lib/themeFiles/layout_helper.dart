import 'package:alumni/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import '../main.dart';

//Percentage height and width variables
var width = MediaQuery.of(navigatorKey.currentContext!).size.width;
var height = MediaQuery.of(navigatorKey.currentContext!).size.height;

//SizedBoxes
class LayoutHelper {
  //horizontal symetric padding 15

  static Widget pageContainer(
      {double horizontalPadding = 0,
      floatingActionButton,
      AppBar? appBar,
      Color? backgroundColor,
      Key? key,
      FloatingActionButtonLocation? floatingActionButtonLocation,
      Widget? bottomNavigationBar,
      Drawer? drawer,
      void Function()? onTap,
      required Widget child}) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        key: key,
        appBar: appBar,
        backgroundColor:
            backgroundColor ?? AppColors.getColor(AppColorsEnum.background),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation ??
            FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: child,
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
      ),
    );
  }

  static Widget pageContainerWithoutScroll(
      {double horizontalPadding = 0,
      floatingActionButtonLocation,
      floatingActionButton,
      Color? backgroundColor,
      AppBar? appBar,
      Drawer? drawer,
      Widget? bottomNavigationBar,
      required Widget child}) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: child,
        ),
      ),
    );
  }

  static Widget symetric15(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  static Widget symetric25(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: child,
    );
  }

  static Widget vertical10(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }

  static Widget vertical15(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: child,
    );
  }

  static SizedBox width5() {
    return const SizedBox(
      width: 5,
    );
  }

  static SizedBox width3() {
    return const SizedBox(
      width: 3,
    );
  }

  static SizedBox width10() {
    return const SizedBox(
      width: 10,
    );
  }

  static SizedBox width15() {
    return const SizedBox(
      width: 15,
    );
  }

  static SizedBox width20() {
    return const SizedBox(
      width: 20,
    );
  }

  static SizedBox width30() {
    return const SizedBox(
      width: 30,
    );
  }

  static SizedBox height5() {
    return const SizedBox(
      height: 5,
    );
  }

  static SizedBox height3() {
    return const SizedBox(
      height: 3,
    );
  }

  static SizedBox height10() {
    return const SizedBox(
      height: 10,
    );
  }

  static SizedBox height15() {
    return const SizedBox(
      height: 15,
    );
  }

  static SizedBox height20() {
    return const SizedBox(
      height: 20,
    );
  }

  static SizedBox height30() {
    return const SizedBox(
      height: 30,
    );
  }

  static SizedBox height40() {
    return const SizedBox(
      height: 40,
    );
  }
}
