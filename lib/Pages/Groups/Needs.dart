import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class Needs extends StatefulWidget {
  const Needs({super.key});

  @override
  State<Needs> createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Container(
          height: height * 0.6,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        textKey: "Alumni Needs (3)",
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      ),
                      CustomText(
                        textKey: "+Add Needs",
                        color: AppColors.getColor(AppColorsEnum.primary),
                      ),
                    ],
                  ),
                ),
                LayoutHelper.height10(),
                SizedBox(
                  height: height * 0.6,
                  width: width * 0.95,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return alumniNeedTile();
                  }),
                ),
              ],
            ),
          ),
        ));
  }

  alumniNeedTile() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
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
                LayoutHelper.height10(),
                Text(
                  "This is My Batchmate i am sharing this as he needs Job urgently and hope for positive response",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            width: width * 0.85,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.withOpacity(0.18),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundImage:
                                AssetImage(ImageConstant.commentPerson),
                          ),
                          LayoutHelper.width10(),
                          CustomText(
                            textKey: "Mark",
                            bold: true,
                            size: 13,
                            color: AppColors.getColor(
                              AppColorsEnum.primary,
                            ),
                          ),
                          LayoutHelper.width10(),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.getColor(
                                AppColorsEnum.secondaryColor,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 1, bottom: 1),
                            child: CustomText(
                              textKey: "Need Job",
                              size: 9,
                              bold: true,
                              color: AppColors.getColor(
                                AppColorsEnum.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      CustomText(
                        textKey: "21 Feb, 2023",
                        color: Colors.black38,
                        size: 10,
                        bold: true,
                      )
                    ],
                  ),
                  LayoutHelper.height5(),
                  Column(
                    children: [
                      const Text(
                        "I am currently looking to relocate to Washington, D.C and am searching for a new mid-level marketing job in the city.....",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  LayoutHelper.height5(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.getColor(AppColorsEnum.primary),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: width * 0.35,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Reply",
                            style: TextStyle(
                                color: AppColors.getColor(AppColorsEnum.white)),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.getColor(AppColorsEnum.primary),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
