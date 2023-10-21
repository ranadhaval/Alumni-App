import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Jobs extends StatefulWidget {
  Jobs({
    super.key,
  });

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        textKey: "10 Jobs",
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      ),
                      CustomText(
                        textKey: "+Add Jobs",
                        color: AppColors.getColor(AppColorsEnum.primary),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: HexColor("#f8f8f8"),
                  height: height,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return opportunitiesTile();
                  }),
                ),
              ],
            ),
          ),
        ));
  }

  opportunitiesTile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    textKey: "Shared by:  ",
                    size: 11,
                    color: Colors.black38,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(ImageConstant.archit),
                      ),
                      LayoutHelper.width5(),
                      CustomText(
                        textKey: "Archit",
                        size: 11,
                        color: AppColors.getColor(AppColorsEnum.primary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          width: width * 0.9,
          padding:
              const EdgeInsets.only(left: 5, right: 5, top: 12, bottom: 15),
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
              Text(
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
