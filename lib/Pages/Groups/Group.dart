import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Constants/image_constant.dart';
import '../../Widgets/Widgets/custom_text.dart';
import 'Explore_page.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> with SingleTickerProviderStateMixin {
  TabController? controller;

  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

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
                  CustomText(
                    textKey: "Groups",
                    size: 17,
                    color: Colors.black,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
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
                height: 50,
                color: HexColor("#f8f8f8"),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    controller: controller,
                    tabs: [Text("Explore"), Text("My Groups")])),
            LayoutHelper.height10(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12)),
                child: CustomInputField(
                    verticalContentPadding: 0,
                    horizontalContentPadding: 4,
                    prefixWidget: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                    borderRadius: 20,
                    allBorderdisable: true,
                    hintstyle:
                        const TextStyle(fontSize: 12, color: Colors.black12),
                    fillColor: AppColors.getColor(AppColorsEnum.white),
                    hint: "Search Alumni/ Events/ News....",
                    textEditingController: _controller),
              ),
            ),
            LayoutHelper.height5(),
            SizedBox(
              height: height * 0.8,
              child: ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.only(bottom: 30),
                  itemBuilder: (context, index) {
                    return groupTile();
                  }),
            ),
            Container(
              height: 8,
              color: Colors.grey.withOpacity(0.15),
            ),
          ],
        ));
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];

  final TextEditingController _controller = TextEditingController();

  groupTile() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ExplorePage()));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                                image: AssetImage(ImageConstant.groups),
                                fit: BoxFit.cover)),
                      )
                    ],
                  ),
                ),
                LayoutHelper.width15(),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textKey: "Delhi Alumni",
                        size: 12,
                        bold: true,
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      ),
                      LayoutHelper.height5(),
                      Text(
                        "This group is created for alumni’s located in Delhi for better connectivity and quick query solutions by nearby Alumni’s",
                        style: TextStyle(
                          fontSize: 9,
                          color: AppColors.getColor(AppColorsEnum.black),
                        ),
                      ),
                      LayoutHelper.height10(),
                      Row(
                        children: [
                          CustomText(
                            textKey: "Admin:",
                            size: 11,
                            color: Colors.black38,
                          ),
                          LayoutHelper.width10(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundImage:
                                    AssetImage(ImageConstant.commentPerson),
                              ),
                              LayoutHelper.width5(),
                              CustomText(
                                textKey: "Faisal",
                                size: 11,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      LayoutHelper.height10(),
                      SizedBox(
                        height: height * 0.017,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 4,
                                ),
                                for (int i = 0; i < 3; i++)
                                  Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 12,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundImage: AssetImage(image[i]),
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  width: 4,
                                ),
                                CustomText(
                                  textKey: ".....+69",
                                  size: 10,
                                  bold: true,
                                  color: AppColors.getColor(AppColorsEnum.black)
                                      .withOpacity(0.4),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      LayoutHelper.height5(),
                      Row(
                        children: [
                          LayoutHelper.width5(),
                          CustomText(
                            textKey: "Attending Event",
                            size: 7,
                            bold: true,
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
                          )
                        ],
                      ),
                      LayoutHelper.height10(),
                    ],
                  ),
                )
              ],
            ),
            LayoutHelper.height5(),
            CustomText(
              textKey: "Current Posts",
              size: 10,
            ),
            LayoutHelper.height5(),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: CustomText(
                    textKey: "12 Job Opportunities",
                    size: 11,
                    color: AppColors.getColor(AppColorsEnum.white),
                  ),
                ),
                LayoutHelper.width5(),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: CustomText(
                    textKey: "5 Upcoming Events",
                    size: 11,
                    color: AppColors.getColor(AppColorsEnum.white),
                  ),
                ),
                LayoutHelper.width5(),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      borderRadius: BorderRadius.circular(7)),
                  child: CustomText(
                    textKey: "5 Queries",
                    size: 11,
                    color: AppColors.getColor(AppColorsEnum.white),
                  ),
                )
              ],
            ),
            LayoutHelper.height15(),
            SizedBox(
              width: width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: AppColors.getColor(AppColorsEnum.primary)),
                  onPressed: () {},
                  child: CustomText(
                    textKey: "Join",
                    size: 17,
                    color: AppColors.getColor(AppColorsEnum.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
