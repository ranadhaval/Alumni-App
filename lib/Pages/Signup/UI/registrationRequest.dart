import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/CreateProfile/UI/create_profile.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class RegistrationReq extends StatefulWidget {
  static String routeName = '/welcome';
  const RegistrationReq({super.key});
  @override
  State<RegistrationReq> createState() => _RegistrationReqState();
}

class _RegistrationReqState extends State<RegistrationReq> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        appBar: appBar(
            color: AppColors.getColor(
          AppColorsEnum.subHeading,
        )),
        backgroundColor: AppColors.getColor(AppColorsEnum.primary),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: AppColors.getColor(AppColorsEnum.secondaryColor),
                child: SizedBox(
                  height: height * 0.75,
                  width: width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          LayoutHelper.width10(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 10, top: 50),
                            child: SizedBox(
                              height: height * 0.2,
                              width: width * 0.6,
                              child: Image(
                                  image: AssetImage(
                                ImageConstant.registrationTime,
                              )),
                            ),
                          ),
                          CustomText(
                            textKey: AppStrings.yourRegistrationRequestIs,
                            color: AppColors.getColor(AppColorsEnum.white),
                          ),
                          CustomText(
                              textKey:
                                  AppStrings.sentSuccesfullyIdDetailsWillbe,
                              color: AppColors.getColor(AppColorsEnum.white)),
                          CustomText(
                              textKey: AppStrings.sendToYourEmailAccount,
                              color: AppColors.getColor(AppColorsEnum.white)),
                          CustomText(
                              textKey: AppStrings.approved,
                              color: AppColors.getColor(AppColorsEnum.white)),
                          LayoutHelper.height10(),
                          CustomText(
                              bold: true,
                              textKey: AppStrings.notificationsentWillbein48,
                              color: AppColors.getColor(AppColorsEnum.primary)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: CustomButtonElevated(
                            type: ButtonType.primary,
                            buttonColor:
                                AppColors.getSingleColor(AppColorsEnum.primary),
                            text: AppStrings.gotIt,
                            onTap: () async {
                              navigateToPageWithoutReplaceMentNamed(
                                  SignIn.routeName);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              LayoutHelper.height20(),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        size: 12,
                        textKey: AppStrings.inCaseYourIdIsNotApproved,
                        color: AppColors.getColor(AppColorsEnum.white)),
                    LayoutHelper.height15(),
                    CustomText(
                        size: 12,
                        textKey: AppStrings.ifAnyNotificationWillnotBeREceived,
                        color: AppColors.getColor(AppColorsEnum.white)),
                    CustomText(
                        size: 12,
                        textKey: AppStrings.sendYourEmailId,
                        color: AppColors.getColor(AppColorsEnum.white)),
                    LayoutHelper.height5(),
                    CustomText(
                        bold: true,
                        textKey: AppStrings.admin12gmail,
                        color:
                            AppColors.getColor(AppColorsEnum.secondaryColor)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
