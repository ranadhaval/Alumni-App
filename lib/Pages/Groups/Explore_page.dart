import 'package:alumni/Pages/Groups/Events.dart';
import 'package:alumni/Pages/Groups/Jobs.dart';
import 'package:alumni/Pages/Groups/Members.dart';
import 'package:alumni/Pages/Groups/Needs.dart';
import 'package:alumni/Pages/Groups/chatRoom.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/image_constant.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
                              textKey: "Delhi Alumni",
                              size: 17,
                              color: AppColors.getColor(AppColorsEnum.primary),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 11,
                                backgroundColor: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    ImageConstant.i,
                                  ),
                                ),
                              ),
                            ),
                            LayoutHelper.width15(),
                            Icon(
                              Icons.share,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor),
                              size: 28,
                            ),
                            LayoutHelper.width10(),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                                size: 28,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.225,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.groupProfileImage),
                            fit: BoxFit.cover),
                        color:
                            AppColors.getColor(AppColorsEnum.secondaryColor)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage(ImageConstant.groupProfileCircle),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  textKey: "Delhi Alumni",
                  color: AppColors.getColor(AppColorsEnum.primary),
                )
              ],
            ),
            LayoutHelper.height10(),
            Container(
              padding: EdgeInsets.only(left: 14, right: 14, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.getColor(AppColorsEnum.secondaryColor)),
              child: CustomText(
                textKey: "Join",
                size: 12,
                color: AppColors.getColor(AppColorsEnum.white),
              ),
            ),
            LayoutHelper.height10(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _addBox(title: "Jobs", index_: 1),
                      _addBox(title: "Events", index_: 2),
                      _addBox(
                          height_: 0.058,
                          width_: 0.12,
                          radius: 35,
                          padding: 10,
                          space: 10,
                          topPadding: 5,
                          title: "Chat Room",
                          index_: 3),
                      _addBox(title: "Needs", index_: 4),
                      _addBox(title: "Members", index_: 5),
                    ],
                  ),
                ),
              ],
            ),
            LayoutHelper.height5(),
            Container(
              height: height * 0.52,
              child: Builder(builder: (context) {
                switch (index) {
                  case 1:
                    return Jobs();
                  case 2:
                    return const EventsPage();
                  case 3:
                    return const ChatRoom();
                  case 4:
                    return const Needs();
                  case 5:
                    return const MemberPage();

                  default:
                    return Jobs();
                }
              }),
            )
          ],
        ));
  }

  _addBox({
    double height_ = 0.045,
    double width_ = 0.085,
    double padding = 7,
    double topPadding = 10,
    double radius = 8,
    required String title,
    double space = 15,
    bool isNotification = false,
    void Function()? onTap,
    required int index_,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          index = index_;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Container(
              height: height * height_,
              width: width * width_,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: index_ == index
                      ? AppColors.getColor(AppColorsEnum.primary)
                      : HexColor("#937ca9")
                  //  AppColors.getColor(AppColorsEnum.primary)

                  ),
              child: Center(
                child: isNotification
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image(
                            image: AssetImage(ImageConstant.notification)),
                      )
                    : CircleAvatar(
                        backgroundColor: index_ == index
                            ? AppColors.getColor(AppColorsEnum.secondaryColor)
                            : HexColor("#f5eae2"),
                        // AppColors.getColor(AppColorsEnum.secondaryColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: space),
            child: CustomText(
              textKey: title,
              size: 10,
            ),
          )
        ],
      ),
    );
  }

  int index = 1;
}
