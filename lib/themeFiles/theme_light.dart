import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import 'app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.getSingleColor(AppColorsEnum.primary),
    canvasColor: AppColors.getSingleColor(AppColorsEnum.background),
    secondaryHeaderColor:
        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
    primaryColorLight: AppColors.getSingleColor(AppColorsEnum.lintColor),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.getSingleColor(AppColorsEnum.primary),
        background: AppColors.getSingleColor(AppColorsEnum.background)),
    scaffoldBackgroundColor: AppColors.getSingleColor(AppColorsEnum.background),
    dialogBackgroundColor: AppColors.getSingleColor(AppColorsEnum.lintColor),
    fontFamily: "Quicksand",
    //SharedHelper.getTranslatedText("Font"),

    //Heading Text
    primaryTextTheme: TextTheme(
      headlineLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      headlineMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      headlineSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      titleLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      titleMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      titleSmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      bodyLarge: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      bodyMedium: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),
      bodySmall: TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: AppColors.getSingleColor(AppColorsEnum.primary),
      ),

      //Button Text
      labelLarge: const TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: const TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 36, fontWeight: FontWeight.w700, color: primaryColor),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        letterSpacing: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
                AppColors.getSingleColor(AppColorsEnum.primary)))),
    appBarTheme: AppBarTheme(
        color: primaryColor,

        //titleTextStyle: AppTextStyle.bodyLarge,
        elevation: 0.0,

        iconTheme: IconThemeData(
            color: AppColors.getSingleColor(AppColorsEnum.invert))),
    inputDecorationTheme: const InputDecorationTheme(
      //contentPadding: const EdgeInsets.only(bottom: 3),
      labelStyle: TextStyle(
        //height: 0.6,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      fillColor: lintLightColor,
      isDense: true,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: primaryColor,
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
    ),
    dividerColor: dividerColor,
    drawerTheme: const DrawerThemeData(backgroundColor: backgroundLightColor),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      focusColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shadowColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: primaryColor,
      textStyle: const TextStyle(color: backgroundLightColor),
    )),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),

    navigationBarTheme: NavigationBarThemeData(
        // iconTheme: MaterialStateProperty.all(IconThemeData(color: AppColors.getSingleColor(AppColorsEnum.white)),

        indicatorColor: AppColors.getSingleColor(AppColorsEnum.primary),
        backgroundColor: AppColors.getSingleColor(AppColorsEnum.background)),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.getSingleColor(AppColorsEnum.lintColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    ),
    cardColor: cardBackgroundColor,
    snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.getSingleColor(AppColorsEnum.primary),
        actionTextColor: primaryColor),
  );
}
