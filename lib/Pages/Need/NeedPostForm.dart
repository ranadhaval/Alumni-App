import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Need/Need.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NeedPostForm extends StatefulWidget {
  const NeedPostForm({super.key});

  @override
  State<NeedPostForm> createState() => _NeedPostFormState();
}

class _NeedPostFormState extends State<NeedPostForm> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Column(
          children: [
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              decoration: BoxDecoration(
                  color: AppColors.getColor(AppColorsEnum.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      offset: Offset(0, 4),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                child: SvgPicture.asset(
                              ImageConstant.arrowBack,
                            )),
                            LayoutHelper.width10(),
                            CustomText(
                              textKey: "Add Need",
                              size: 17,
                              color: AppColors.getColor(AppColorsEnum.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            LayoutHelper.height10(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                // height: 30,
                width: width * 0.88,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12, width: 7)),
                child: CustomInputField(
                    verticalContentPadding: 5,
                    horizontalContentPadding: 8,
                    borderRadius: 8,
                    maxLines: 8,
                    allBorderdisable: true,
                    hintstyle:
                        const TextStyle(fontSize: 12, color: Colors.black12),
                    fillColor: AppColors.getColor(AppColorsEnum.white),
                    hint: "Add Text Here",
                    textEditingController: _controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 20, top: 20, bottom: 50),
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image(
                              image: AssetImage(ImageConstant.needPerson))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: CustomText(
                          textKey: "Tag People",
                          size: 10,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                  LayoutHelper.width15(),
                  Row(
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image(
                              image: AssetImage(ImageConstant.needPerson))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: CustomText(
                          textKey: "Add Document",
                          size: 10,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            LayoutHelper.height10(),
            Container(
              height: 30,
              width: width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Need(
                                isAdded: true,
                              )));
                },
                child: Text(
                  "Post Need",
                  style: TextStyle(
                      color: AppColors.getColor(AppColorsEnum.white),
                      fontSize: 10),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.getColor(AppColorsEnum.secondaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ));
  }

  TextEditingController _controller = TextEditingController();
}
