import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/classes/widget_helper_class.dart';
import '../../themeFiles/app_colors.dart';
import 'succesfullyRegistredForEventPage.dart';

class EventRegistrationForm extends StatefulWidget {
  const EventRegistrationForm({super.key});

  @override
  State<EventRegistrationForm> createState() => _EventRegistrationFormState();
}

class _EventRegistrationFormState extends State<EventRegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: AppColors.getColor(AppColorsEnum.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                    ),
                  ]),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImageConstant.arrowBack),
                        LayoutHelper.width10(),
                        CustomText(
                          textKey: "Charity Events",
                          size: 17,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            LayoutHelper.height20(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey: "Fill up Some Details for Event Regestration",
                    color: AppColors.getColor(AppColorsEnum.grey),
                  ),
                  WidgetHelper.inputHeadingTile(
                      title: " Your Name", leftPadding: 0),
                  for (int i = 0; i < 1; i++)
                    ...WidgetHelper.getNameAndInputField(
                      allBorderdisable: true,
                      "Your Name",
                      controller[0],
                      context,
                      fillColor: Colors.white,
                      enabledBorderWidth: 0,
                      isShowIcon: true,
                      verticalContentPadding: 13,
                    ),
                  WidgetHelper.inputHeadingTile(
                      title: " Your Number", leftPadding: 0),
                  for (int i = 0; i < 1; i++)
                    ...WidgetHelper.getNameAndInputField(
                      allBorderdisable: true,
                      "Your Number",
                      controller[1],
                      context,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text("+91 |")],
                      ),
                      fillColor: Colors.white,
                      enabledBorderWidth: 0,
                      isShowIcon: true,
                      verticalContentPadding: 13,
                    ),
                  WidgetHelper.inputHeadingTile(
                      title: " E-mail Conformation", leftPadding: 0),
                  for (int i = 0; i < 1; i++)
                    ...WidgetHelper.getNameAndInputField(
                      allBorderdisable: true,
                      "-----@Gmail.com",
                      controller[2],
                      context,
                      isEmail: true,
                      fillColor: Colors.white,
                      enabledBorderWidth: 0,
                      isShowIcon: true,
                      verticalContentPadding: 13,
                    ),
                  LayoutHelper.height15(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.white),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.getColor(AppColorsEnum.gray200),
                              spreadRadius: 0.7,
                              offset: Offset(0.04, 0.04))
                        ]),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 2, top: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textKey: "Rules & Regulations",
                            color: AppColors.getColor(AppColorsEnum.primary),
                          ),
                          LayoutHelper.height5(),
                          Text(
                              "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores"),
                          LayoutHelper.height5(),
                          CustomText(
                            textKey: "Read More",
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  LayoutHelper.height15(),
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: check,
                        checkColor: AppColors.getColor(AppColorsEnum.primary),
                        focusColor: AppColors.getColor(AppColorsEnum.primary),
                        onChanged: (value) {
                          setState(() {
                            check = !check;
                          });
                        },
                        activeColor: AppColors.getColor(AppColorsEnum.primary),
                      ),
                      CustomText(
                        textKey:
                            "I Accept & Follow rules mentioned for this event",
                        size: 12,
                        color: AppColors.getColor(AppColorsEnum.primary),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            primary: AppColors.getColor(AppColorsEnum.primary)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const SuccesfullEventRegistration()));
                        },
                        child: CustomText(
                          textKey: "Register",
                          size: 17,
                          color: AppColors.getColor(AppColorsEnum.white),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  bool check = false;
  List<TextEditingController> controller = getTextController(3);
}
