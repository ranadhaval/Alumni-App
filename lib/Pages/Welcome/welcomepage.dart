import 'package:alumni/Blocs/HomeBloc/HomeEvent/home_event.dart';
import 'package:alumni/Blocs/HomeBloc/home_bloc.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/Home/home.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatefulWidget {
  static String routeName = '\\welcome';
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => HomeBloc()..add(HomeIdsLodingEvent()),
                    child: const Home(),
                  )),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainerWithoutScroll(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstant.welcomeBackground))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: AppColors.getColor(AppColorsEnum.secondaryColor),
            child: Column(
              children: [
                LayoutHelper.height10(),
                CustomText(
                  textKey: AppStrings.welcomeTo,
                  size: 30,
                  color: AppColors.getColor(AppColorsEnum.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: SizedBox(
                    height: height * 0.4,
                    width: width * 0.6,
                    child: Image(
                        image: AssetImage(
                      ImageConstant.logo,
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
