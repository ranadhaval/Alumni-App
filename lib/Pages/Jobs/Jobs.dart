import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class JobsAdd extends StatefulWidget {
  const JobsAdd({super.key});

  @override
  State<JobsAdd> createState() => _JobsAddState();
}

class _JobsAddState extends State<JobsAdd> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              decoration: BoxDecoration(
                  color: AppColors.getColor(AppColorsEnum.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            child: SvgPicture.asset(
                          ImageConstant.arrowBack,
                        )),
                        LayoutHelper.width10(),
                        CustomText(
                          textKey: "Jobs",
                          size: 17,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.037,
                        width: width * 0.08,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.getColor(AppColorsEnum.primary)),
                        child: Center(
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 12, bottom: 15),
              margin: const EdgeInsets.all(4),
              child: DottedBorder(
                color: HexColor("#ad1afb"), //color of dotted/dash line
                strokeWidth: 3, //thickness of dash/dots
                dashPattern: [10, 6],
                radius: const Radius.circular(5),

                child: Container(
                  color: HexColor("#f8f8f8"),
                  height: height,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return opportunitiesTile();
                  }),
                ),
              ),
            ),
          ],
        ));
  }

  opportunitiesTile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.9,
          decoration: BoxDecoration(
              color: AppColors.getColor(AppColorsEnum.white),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: height * 0.048,
                        width: width * 0.10,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0.5, 5),
                                  spreadRadius: 0.3,
                                  blurRadius: 0.5,
                                  color: Colors.grey.shade200)
                            ],
                            color: AppColors.getColor(AppColorsEnum.white),
                            borderRadius: BorderRadius.circular(50)),
                        child:
                            Image(image: AssetImage(ImageConstant.accenture)),
                      ),
                      LayoutHelper.width10(),
                      CustomText(
                        textKey: "Accenture",
                        size: 12,
                        bold: true,
                        color: AppColors.getColor(AppColorsEnum.primary),
                      )
                    ],
                  ),
                  CustomText(
                    textKey: "1 Week Ago",
                    size: 11,
                  ),
                ],
              ),
              LayoutHelper.height5(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  richtext(
                      firstTitle: "Role: ", secondTitle: "Graphic Designer"),
                  richtext(
                      firstTitle: "Experience: ", secondTitle: "3-4 Years"),
                ],
              ),
              LayoutHelper.height5(),
              richtext(
                  firstTitle: "Banglore, India ",
                  secondTitle: "(Remote)",
                  secondTitleColor: AppColors.getColor(AppColorsEnum.primary)),
              const Text(
                "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo........More",
                style: TextStyle(fontSize: 10, color: Colors.black38),
              ),
              LayoutHelper.height5(),
              Row(
                children: [
                  CustomText(
                    textKey: "By:",
                    size: 11,
                    color: Colors.black38,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage:
                            AssetImage(ImageConstant.commentPerson),
                      ),
                      LayoutHelper.width5(),
                      CustomText(
                        textKey: "Faisal",
                        size: 11,
                        color: AppColors.getColor(AppColorsEnum.primary),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: width * 0.9,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: AppColors.getColor(AppColorsEnum.primary)),
              onPressed: () {},
              child: CustomText(
                textKey: "Apply",
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        )
      ],
    );
  }

  richtext(
      {required String firstTitle,
      required String secondTitle,
      Color? secondTitleColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black38, fontSize: 10),
              text: firstTitle,
              children: [
            TextSpan(
                style: TextStyle(
                    color: secondTitleColor != null
                        ? secondTitleColor
                        : AppColors.getColor(AppColorsEnum.secondaryColor),
                    fontSize: 10),
                text: secondTitle)
          ])),
    );
  }
}
