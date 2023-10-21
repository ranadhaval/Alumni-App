import 'dart:async';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Pages/OnBoarding/onboarding.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:flutter/services.dart';
import '../../Functions/common.dart';
import '../../Services/shared_helper.dart';
import '../../Constants/strings.dart';
import '../../themeFiles/app_typography.dart';
import '../../themeFiles/layout_helper.dart';
// ignore: unused_import
import '../../themeFiles/utils/bottomNav.dart';

class LanguageScreen extends StatefulWidget {
  static String routeName = '/choose-language';

  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.getColor(
              AppColorsEnum.secondaryColor,
            )),
      ),
      backgroundColor: AppColors.getSingleColor(AppColorsEnum.secondaryColor),
      //Logo
      child: Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash-foreground.png"),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/alumni-main-logo.png',
                width: width * 0.4,
                height: height * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedLanguage = SharedHelper.getSelectedLanguage();

  //Opens the BottomSheet after 3 seconds
  @override
  void initState() {
    super.initState();
    // Set a timer to open the bottom sheet after 5 seconds
    Timer(const Duration(seconds: 3), () {
      navigateToPageReplaceMent(SignIn());
      // _showLanguageSelector();
    });
  }

  //BottomShet Function
  void _showLanguageSelector() {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      barrierColor: Colors.transparent,
      context: context!,
      builder: (BuildContext context) {
        return LayoutHelper.symetric25(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LayoutHelper.height30(),

              //heading
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CustomText(
                  textKey: AppStrings.chooseLanguage,
                  style: AppTextStyle.bodyLarge,
                ),
              ),

              //subheading
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CustomText(
                  textKey: AppStrings.selectPreferedLanguage,
                  style: AppTextStyle.bodySmall,
                ),
              ),

              //English Button
              LayoutHelper.height30(),
              CustomButtonElevated(
                type: ButtonType.languageButton,
                text: AppStrings.english,
                isSelected: selectedLanguage == 0,
                onTap: () async {
                  if (selectedLanguage == 1) {
                    await SharedHelper.changeLanguage(0);
                  }
                  setState(() {
                    selectedLanguage == 0;
                  });
                  navigateToPageWithoutReplaceMentNamed(
                      OnboardScreen.routeName);
                },
                image:
                    'https://i.pinimg.com/736x/89/39/33/89393392a179b7a1dd640e6dddf89966.jpg',
              ),

              LayoutHelper.height20(),

              //Arabic Button
              CustomButtonElevated(
                type: ButtonType.languageButton,
                text: AppStrings.arabic,
                isSelected: selectedLanguage == 1,
                onTap: () async {
                  if (selectedLanguage == 0) {
                    await SharedHelper.changeLanguage(1);
                  }
                  setState(() {
                    selectedLanguage == 1;
                  });
                  navigateToPageWithoutReplaceMentNamed(
                      OnboardScreen.routeName);
                },
                image:
                    'https://vectorflags.s3.amazonaws.com/flags/ae-square-01.png',
              ),
              LayoutHelper.height30(),

              LayoutHelper.height20(),
            ],
          ),
        );
      },
    );
  }
}
