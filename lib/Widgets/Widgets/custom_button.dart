// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/main.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/app_typography.dart';
import '../../themeFiles/layout_helper.dart';
import '../classes/widget_helper_class.dart';
import 'custom_text.dart';

enum ButtonType {
  primary,
  primarySmallButton,
  disabled,
  socialButton,
  iconButton, 
  languageButton,
  categoryButton,
  outlineButton,
  paymentButton,
  textButton,
  
  danger,
}

class CustomButtonElevated extends StatelessWidget {
  final ButtonType type;
  final String? text;
  final Function onTap;
  final String? image;
  final IconData? icon;
  final Color? buttonColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? textColor;
  final bool? isSelected;
  final bool  isSmaller;
  final double borderRadius;
  final TextStyle? customStyle;


  const CustomButtonElevated({
    super.key,
    required this.type,
    this.text,
    required this.onTap,
    this.image,
    this.icon,
    this.buttonColor,
    this.iconColor,
    this.borderColor,
    this.textColor,
    this.isSelected,
    this.isSmaller = false,
    this.borderRadius = 10,
    this.customStyle
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return primaryButton(
          text!,
          () => onTap.call(),
          buttonColor ?? AppColors.getColor(AppColorsEnum.primary),
        );
      case ButtonType.primarySmallButton:
        return primarySmallButton(
          text!,
          () => onTap.call(),
          buttonColor ?? AppColors.getColor(AppColorsEnum.primary),
        );
      case ButtonType.disabled:
        return primaryButton(
          text!,
              () =>  (){},
          buttonColor ?? AppColors.getColor(AppColorsEnum.primary).withOpacity(0.3),
        );
      case ButtonType.iconButton:
        return iconButton(
          icon,
          "",
          () => onTap.call(),
          buttonColor ?? AppColors.getSingleColor(AppColorsEnum.primary),
          iconColor ?? AppColors.getSingleColor(AppColorsEnum.white),
          smaller: isSmaller
        );
      case ButtonType.socialButton:
        return socialButton(text!, () => onTap.call());
      case ButtonType.languageButton:
        return languageButton(
            text!,
            () => onTap.call(),
            AppColors.getColor(
              AppColorsEnum.secondaryColor,
            ),
            image, isSelected!);
      case ButtonType.categoryButton:
        return categoryButton(
            text!,
            () => onTap.call(),
            AppColors.getColor(
              AppColorsEnum.secondaryColor,
            ),
            image);
      case ButtonType.outlineButton:
        return outlineButton(
          text!,
          () => onTap.call(),
          borderRadius,
          buttonColor,
          borderColor,
            customStyle

        );
      case ButtonType.paymentButton:
        return paymentButton(text!, image!, () => onTap.call(), isSelected!);
      case ButtonType.textButton:
        return textButton(
          text!,
          () => onTap.call(),
          buttonColor ??
              AppColors.getColor(
                AppColorsEnum.lintColor,
              ),
          textColor ??
              AppColors.getColor(AppColorsEnum.secondaryColor),
        );
      default:
        return Container();
    }
  }
}

Widget primaryButton(
  String text,
  Function onTap,
  Color buttonColor,
) {
  return LayoutHelper.symetric25(
    ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () => onTap.call(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CustomText(
                    textKey: text,
                    color: AppColors.getSingleColor(AppColorsEnum.white),
                    style: AppTextStyle
                        .titleMedium),
              ),
            ],
          ),
        )),
  );
}

Widget primarySmallButton(
  String text,
  Function onTap,
  Color buttonColor,
) {
  return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                  textKey: text,
                  color: AppColors.getSingleColor(AppColorsEnum.white),
                  style: Theme.of(navigatorKey.currentContext!)
                      .textTheme
                      .titleMedium),
            ),
          ],
        ),
      ));
}

 
Widget socialButton(
  String text, //exceptional for this button we are passing asset String
  Function onTap,
) {
  return InkWell(
    radius: 100,
    borderRadius: BorderRadius.circular(100),
    onTap: () => onTap.call(),
    child: SvgPicture.asset(
      text,
      width: 45,
      height: 45,
    ),
  );
}

Widget iconButton(
  IconData? icon,
  String text,
  Function onTap,
  Color buttonColor,
  Color? iconColor,
{ bool  smaller = false}
) {
  return SizedBox(
    height: smaller? 40 : 50,
    width: smaller? 40 : 50,
    child: Center(
      child: ElevatedButton(
          style: OutlinedButton.styleFrom(
           padding:  smaller? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 15),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () => onTap.call(),
          child: Icon(
            icon,
            size: smaller?18:20,

            color:  iconColor ?? AppColors.getSingleColor(AppColorsEnum.white)   ,
          )),
    ),
  );
}

Widget languageButton(
    String text, Function onTap, Color buttonColor, String? languageImage, bool isSelected) {
  return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.getColor(AppColorsEnum.lintColor),
        elevation: 0,
        shape:  RoundedRectangleBorder(
          side: BorderSide(color: AppColors.getColor(isSelected?  AppColorsEnum.secondaryColor: AppColorsEnum.gray200)),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetHelper().getCircularCachedImage(languageImage!, 40, 40),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomText(
                textKey: text,
                color: AppColors.getColor(AppColorsEnum.invert),
                style: AppTextStyle
                    .titleMedium,
              ),
            ),
          ],
        ),
      ));
}

Widget categoryButton(
    String text, Function onTap, Color buttonColor, String? categoryImage) {
  return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.getColor(AppColorsEnum.lintColor),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () => onTap.call(),
      child: LayoutHelper.vertical15(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetHelper().getCachedImage(categoryImage!, 25, 25),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                textKey: text,
                color: AppColors.getColor(AppColorsEnum.invert),
                style:  AppTextStyle
                    .titleSmall,
              ),
            ),
          ],
        ),
      ));
}

Widget outlineButton(
  String text,
  Function onTap,
    double? borderRadius,
    Color? buttonColor,
    Color? borderColor,
    TextStyle? customStyle,
) {
  return ElevatedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: buttonColor ?? AppColors.getColor(AppColorsEnum.background),
        shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular( borderRadius ?? 10),
            side: BorderSide(color: borderColor ?? AppColors.getColor(AppColorsEnum.shadow))),
      ),
      onPressed: () => onTap.call(),
      child: SizedBox(
        height: 50,
        width: width,
        child: Center(
          child: CustomText(
              textKey: text,
              color: AppColors.getSingleColor(AppColorsEnum.invert),
              style: customStyle ??
                  Theme.of(navigatorKey.currentContext!).textTheme.titleSmall),
        ),
      ));
}

Widget paymentButton(
    String text, String image, Function onTap, bool isSelected) {
  return GestureDetector(
    onTap: () => onTap,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              decoration: isSelected
                  ? getBoxDecorationWithBorder(5, Colors.transparent,
                      AppColors.getColor(AppColorsEnum.shadow))
                  : BoxDecoration(),
              child: SizedBox(height: 50, width: 50, child: Image.asset(image)),
            ),
            isSelected
                ? Transform.translate(
                    offset: Offset(10, -25),
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: getBoxDecorationWithBorder(
                            50,
                            AppColors.getSingleColor(AppColorsEnum.lightGreen),
                            AppColors.getSingleColor(AppColorsEnum.shadow)),
                        child: Icon(
                          Icons.check,
                          size: 12,
                          color: AppColors.getSingleColor(AppColorsEnum.white),
                        )))
                : SizedBox()
          ],
        ),
        CustomText(textKey: text),
      ],
    ),
  );
}

Widget textButton(String text, Function onTap, Color color, Color textColor) {
  return TextButton(
      onPressed: () => onTap.call(),
      child: CustomText(
          textKey: text,
          color: textColor  ,
          style: AppTextStyle.titleSmall ));
}
