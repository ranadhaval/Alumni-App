import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Event/organizerAndOtherParticipants.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class SuccesfullEventRegistration extends StatefulWidget {
  static String routeName = '/SuccesfullEventRegistration';
  const SuccesfullEventRegistration({super.key});

  @override
  State<SuccesfullEventRegistration> createState() =>
      _SuccesfullEventRegistrationState();
}

class _SuccesfullEventRegistrationState
    extends State<SuccesfullEventRegistration> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const OrganizerAndOtherParticipants()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.getColor(AppColorsEnum.primary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.3,
            width: width * 0.6,
            child: Image(
                image: AssetImage(
              ImageConstant.sampleImage,
            )),
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
            color: AppColors.getColor(AppColorsEnum.white),
          ),
          LayoutHelper.height10(),
          SizedBox(
            width: width * 0.8,
            child: Text(
              'You Successfully Registered for charity Event',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: AppColors.getColor(AppColorsEnum.white)),
            ),
          ),
          LayoutHelper.height40(),
        ],
      ),
    ));
  }
}
