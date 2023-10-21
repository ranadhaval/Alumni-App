import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ShareAchivements extends StatefulWidget {
  const ShareAchivements({super.key});

  @override
  State<ShareAchivements> createState() => _ShareAchivementsState();
}

class _ShareAchivementsState extends State<ShareAchivements> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageConstant.arrowBack),
                        LayoutHelper.width10(),
                        CustomText(
                          textKey: "Back",
                          color: AppColors.getColor(AppColorsEnum.primary),
                        )
                      ],
                    ),
                  ),
                  CustomText(
                    textKey: "Next",
                    color: AppColors.getColor(AppColorsEnum.secondaryColor),
                  )
                ],
              ),
              feedTile(),
              LayoutHelper.height20(),
              CustomText(textKey: "Add Title"),
              LayoutHelper.height10(),
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          offset: Offset(0.04, 0.04))
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12)),
                child: CustomInputField(
                    verticalContentPadding: 5,
                    horizontalContentPadding: 8,
                    borderRadius: 8,
                    maxLines: 3,
                    allBorderdisable: true,
                    hintstyle:
                        const TextStyle(fontSize: 12, color: Colors.black12),
                    fillColor: AppColors.getColor(AppColorsEnum.white),
                    hint: "Add Title Here",
                    textEditingController: _controller),
              ),
              LayoutHelper.height20(),
              Center(
                child: Container(
                  height: 30,
                  width: width * 0.35,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: AppColors.getColor(AppColorsEnum.white)),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.getColor(AppColorsEnum.primary),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  TextEditingController _controller = TextEditingController();
  feedTile() {
    return Column(
      children: [
        Column(
          children: [
            LayoutHelper.height5(),
            LayoutHelper.height5(),
            SizedBox(
              height: height * 0.4,
              width: width,
              child: Column(
                children: [
                  LayoutHelper.width5(),
                  Container(
                    height: height * 0.4,
                    width: width,
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.winBackground),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.getColor(AppColorsEnum.white)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: HexColor("#f8f8f8"),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 0.5,
                                        offset: Offset(0.04, 0.04))
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          bottom: 7,
                                          top: 5),
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: AppColors.getColor(
                                                AppColorsEnum.white),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  offset: Offset(0.04, 2))
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Colors.black12)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              textKey: "+ Add Text",
                                              size: 12,
                                              bold: true,
                                              color: AppColors.getColor(
                                                  AppColorsEnum.primary),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          LayoutHelper.height10(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                textKey: "Or",
                                size: 12,
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              )
                            ],
                          ),
                          LayoutHelper.height10(),
                          Container(
                            height: 30,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    offset: Offset(0.04, 0.04))
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 6, right: 5),
                                  child: Image(
                                      image:
                                          AssetImage(ImageConstant.addPhoto)),
                                ),
                                CustomText(
                                  textKey: "Add Photo",
                                  size: 10,
                                  // bold: true,
                                  color:
                                      AppColors.getColor(AppColorsEnum.primary),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
