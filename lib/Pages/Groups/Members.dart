import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textKey: "Member (80)",
                color: AppColors.getColor(AppColorsEnum.secondaryColor),
              ),
              LayoutHelper.height10(),
              SizedBox(
                height: height * 0.6,
                width: width * 0.98,
                child: ListView.builder(itemBuilder: (context, index) {
                  return memberTile();
                }),
              ),
            ],
          ),
        ));
  }

  memberTile() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      color: AppColors.getColor(AppColorsEnum.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(ImageConstant.sampleImage)),
                LayoutHelper.width15(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textKey: "Srishti",
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      size: 12,
                    ),
                    CustomText(
                      textKey: "Graphic Designing",
                      color: AppColors.getColor(AppColorsEnum.black),
                      size: 12,
                    ),
                    CustomText(
                      textKey: "Collage of Arts, Delhi",
                      color: AppColors.getColor(AppColorsEnum.black),
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 7, bottom: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.getColor(AppColorsEnum.secondaryColor),
                  ),
                  child: CustomText(
                    textKey: "View Profile",
                    color: AppColors.getColor(AppColorsEnum.white),
                    size: 10,
                  ),
                ),
                LayoutHelper.height10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 17,
                    ),
                    LayoutHelper.width5(),
                    CustomText(
                      textKey: "Delhi",
                      size: 10,
                      bold: true,
                      color: AppColors.getColor(AppColorsEnum.primary),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
