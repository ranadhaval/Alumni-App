import 'package:alumni/Blocs/VerifyOtpBloc/sverify_otp_state/verify_otp_state.dart';
import 'package:alumni/Blocs/VerifyOtpBloc/verify_otp_bloc.dart';
import 'package:alumni/Blocs/VerifyOtpBloc/verify_otp_event/verify_otp_event.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class VerifyOtp extends StatefulWidget {
  static String routeName = '/verifyOtp';
  int userId;
  String email;

  VerifyOtp({super.key, required this.email, required this.userId});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final pinController = TextEditingController();
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LayoutHelper.pageContainer(
          appBar: appBar(
              color: AppColors.getColor(AppColorsEnum.primaryColorAppbar)),
          backgroundColor: AppColors.getColor(AppColorsEnum.primary),
          child: BlocConsumer<VerifyOtpBloc, VerifyOtpMainState>(
            listener: (context, state) {
              if (state is VerifyOtpErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  WidgetHelper.getSnackBar(context, state.Error, Colors.red),
                );
              }
            },
            builder: (context, state) {
              return _body(context, state);
            },
          )),
    );
  }

  _body(context, state) {
    VerifyOtpBloc verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.getColor(AppColorsEnum.white),
                      child: SvgPicture.asset(ImageConstant.backArrow,
                          height: 10,
                          width: 10,
                          color: AppColors.getColor(AppColorsEnum.primary)),
                    ),
                  ),
                  LayoutHelper.width30(),
                  CustomText(
                    textKey: AppStrings.verifyEmail,
                    size: 20,
                    color: AppColors.getColor(AppColorsEnum.white),
                  )
                ],
              ),
            ),
            LayoutHelper.height20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                    textAlign: TextAlign.start,
                    size: 15,
                    color: AppColors.getColor(AppColorsEnum.white),
                    textKey: AppStrings.enterFourDigitOTP),
              ],
            ),
            LayoutHelper.height5(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    textAlign: TextAlign.justify,
                    size: 15,
                    color: AppColors.getColor(AppColorsEnum.white),
                    textKey: widget.email.toString()),
                CustomText(
                  textAlign: TextAlign.justify,
                  size: 16,
                  color: AppColors.getColor(AppColorsEnum.primary),
                  textKey: AppStrings.change_,
                ),
              ],
            ),
            LayoutHelper.height30(),
            Pinput(
                controller: controller,
                autofocus: false,
                validator: (value) {
                  return value ==
                          verifyOtpBloc.regestrationRes.data!.otp.toString()
                      ? null
                      : 'Pin is incorrect';
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                onSubmitted: ((value) {}),
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                errorPinTheme: PinTheme(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                      color: AppColors.getColor(AppColorsEnum.white)),
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.getSingleColor(AppColorsEnum.red)),
                ),
                separator: LayoutHelper.width20(),
                preFilledWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:
                              AppColors.getSingleColor(AppColorsEnum.gray200),
                          borderRadius: BorderRadius.circular(20)),
                      height: 5,
                    ),
                  ],
                ),
                submittedPinTheme: PinTheme(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                      color: AppColors.getColor(AppColorsEnum.white)),
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.getSingleColor(
                          AppColorsEnum.secondaryColor)),
                ),
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.getSingleColor(
                              AppColorsEnum.secondaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      height: 5,
                    ),
                  ],
                ),
                defaultPinTheme: PinTheme(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                      color: AppColors.getColor(AppColorsEnum.white)),
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: AppColors.getColor(AppColorsEnum.primary),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 40, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    textKey: AppStrings.firstOClock,
                    color: AppColors.getColor(AppColorsEnum.white),
                  )
                ],
              ),
            ),
            LayoutHelper.height20(),
            (state is VerifyOtpLoadingState)
                ? CircularProgressIndicator(
                    color:
                        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                  )
                : CustomButtonElevated(
                    buttonColor:
                        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                    type: ButtonType.primary,
                    text: AppStrings.verify,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        verifyOtpBloc.add(VerifyOtpEvent(
                            userOtp: int.parse(controller.text),
                            userId: widget.userId,
                            context: context));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            WidgetHelper.getSnackBar(context,
                                AppStrings.pleaseCheckOtp, Colors.red));
                      }
                    }),
            LayoutHelper.height20(),
            CustomText(
              textAlign: TextAlign.justify,
              size: 16,
              color: AppColors.getSingleColor(AppColorsEnum.white),
              textKey: AppStrings.resendCode,
            ),
          ],
        ),
      ),
    );
  }
}
