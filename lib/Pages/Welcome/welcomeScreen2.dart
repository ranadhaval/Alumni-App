import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/Home/home.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class Welcome2 extends StatefulWidget {
  static String routeName = '/welcome2';
  const Welcome2({super.key});

  @override
  State<Welcome2> createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        appBar: appBar(
            color: AppColors.getColor(AppColorsEnum.secondaryColorAppbar)),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: AppColors.getColor(AppColorsEnum.secondaryColor),
              image: DecorationImage(
                  image: AssetImage(
                ImageConstant.welcomeBackground,
              ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  height: height * 0.3,
                  width: width * 0.6,
                  child: Image(
                      image: AssetImage(
                    ImageConstant.sampleImage,
                  )),
                ),
              ),
              CustomText(
                textKey: 'WELCOME',
                size: 30,
                bold: true,
                color: AppColors.getColor(AppColorsEnum.white),
              ),
              CustomText(
                textKey: 'SHREYA',
                size: 20,
                bold: true,
                color: AppColors.getColor(AppColorsEnum.primary),
              ),
              LayoutHelper.height10(),
              SizedBox(
                width: width * 0.8,
                child: Text(
                  'Explore Best opportunities and stay connected',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.getColor(AppColorsEnum.white)),
                ),
              ),
              LayoutHelper.height20(),
              InkWell(
                onTap: () {
                  navigateToPageReplaceMentNamed(Home.routeName);
                },
                child: CircleAvatar(
                    backgroundColor: AppColors.getColor(AppColorsEnum.white),
                    radius: 25,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 45,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                    )),
              )
            ],
          ),
        ));
  }
}
