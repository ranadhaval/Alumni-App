// ignore_for_file: must_be_immutable

import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Need/NeedPostForm.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Need extends StatefulWidget {
  bool isAdded;
  Need({super.key, required this.isAdded});

  @override
  State<Need> createState() => _NeedState();
}

class _NeedState extends State<Need> with SingleTickerProviderStateMixin {
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
                    textKey: "Need",
                    size: 17,
                    color: Colors.black,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: height * 0.037,
                        width: width * 0.08,
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
                height: 50,
                color: HexColor("#f8f8f8"),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    controller: controller,
                    tabs: [
                      const Text("Explore"),
                      Text(widget.isAdded ? "My Needs (2)" : "My Needs")
                    ])),
            Container(
              height: height * 0.9,
              color: HexColor("#f8f8f8"),
              child: TabBarView(controller: controller, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: height * 0.9,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return alumniNeedTile();
                    }),
                  ),
                ),
                widget.isAdded
                    ? Container(
                        height: 0.9,
                        color: HexColor("#f8f8f8"),
                        child: Column(
                          children: [
                            myAlumniNeedTile(),
                            myAlumniNeedTile(unVerified: false),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 0.9,
                          color: HexColor("#f8f8f8"),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Image(
                                        image:
                                            AssetImage(ImageConstant.objects))),
                              ),
                              LayoutHelper.height10(),
                              CustomText(
                                textKey: "No Needs/questions posted Yet",
                                size: 12,
                                color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor,
                                ),
                              ),
                              LayoutHelper.height15(),
                              Container(
                                height: 30,
                                width: width * 0.3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const NeedPostForm()));
                                  },
                                  child: Text(
                                    "Post Need",
                                    style: TextStyle(
                                        color: AppColors.getColor(
                                            AppColorsEnum.white),
                                        fontSize: 10),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.getColor(
                                          AppColorsEnum.secondaryColor),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
              ]),
            )
          ],
        ));
  }

  TabController? controller;

  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  alumniNeedTile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(ImageConstant.commentPerson),
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
              Row(
                children: [
                  Icon(
                    Icons.share,
                    color: AppColors.getColor(AppColorsEnum.secondaryColor),
                    size: 28,
                  ),
                  LayoutHelper.width10(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      size: 28,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: width * 0.94,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LayoutHelper.height5(),
              const Column(
                children: [
                  Text(
                    "I am currently looking to relocate to Washington, D.C., and am searching for a new mid-level marketing job in the city Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo........More",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              LayoutHelper.height10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: Image(image: AssetImage(ImageConstant.pdf))),
                        CustomText(
                          textKey: "Resume.",
                          size: 12,
                          color: AppColors.getColor(AppColorsEnum.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: width * 0.35,
                    child: ElevatedButton(
                      onPressed: () {
                        replySheet();
                      },
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
              ),
              LayoutHelper.height5(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 12,
                      width: 12,
                      child: Image(image: AssetImage(ImageConstant.chat))),
                  LayoutHelper.width3(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: CustomText(
                      textKey: "25 Replies",
                      size: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.black38,
                  ),
                  LayoutHelper.width3(),
                  CustomText(
                    textKey: "21 Feb, 2023",
                    color: Colors.black38,
                    size: 10,
                    bold: true,
                  ),
                ],
              )
            ],
          ),
        ),
        LayoutHelper.height10(),
      ],
    );
  }

  replySheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (_) {
          return Container(
            height: height * 0.8,
            decoration: BoxDecoration(
                color: AppColors.getColor(AppColorsEnum.white),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // height: 30,
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border:
                                          Border.all(color: Colors.black12)),
                                  child: CustomInputField(
                                      enabledBorderWidth: 0,
                                      verticalContentPadding: 10,
                                      horizontalContentPadding: 10,
                                      maxLines: 10,
                                      prefixWidget: Container(
                                        padding: EdgeInsets.zero,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.zero,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                Icons.gif_rounded,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      suffixIcon: SizedBox(
                                        width: width * 0.25,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image(
                                                image: AssetImage(
                                                  ImageConstant.paperClip,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.mic,
                                              size: 27,
                                            )
                                          ],
                                        ),
                                      ),
                                      hintstyle: const TextStyle(
                                          fontSize: 15, color: Colors.black38),
                                      fillColor: AppColors.getColor(
                                          AppColorsEnum.white),
                                      hint: "Messaggio",
                                      textEditingController: controller_),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    LayoutHelper.height20(),
                    Row(
                      children: [
                        SizedBox(
                            height: 20,
                            width: 20,
                            child:
                                Image(image: AssetImage(ImageConstant.chat))),
                        LayoutHelper.width3(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: CustomText(
                            textKey: "25 Replies",
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.7,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return replyTile();
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  replyTile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(ImageConstant.commentPerson),
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
                  )
                ],
              ),
              CustomText(
                textKey: "21 Feb, 2023",
                color: Colors.black38,
                size: 10,
                bold: true,
              ),
            ],
          ),
        ),
        LayoutHelper.height10(),
        const Text(
          "I am currently looking for freelancer Delhi and am searching for a new Manager for company .....Read More",
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }

  TextEditingController controller_ = TextEditingController();

  myAlumniNeedTile({bool unVerified = true}) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
              Row(
                children: [
                  unVerified
                      ? Container()
                      : Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image(
                                  image: AssetImage(ImageConstant.verify)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: CustomText(
                                textKey: "Solved",
                                size: 12,
                                color: Colors.blue,
                                bold: true,
                              ),
                            ),
                          ],
                        ),
                  LayoutHelper.width10(),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image(image: AssetImage(ImageConstant.delete)),
                  ),
                  LayoutHelper.width10(),
                  InkWell(
                    onTap: () {
                      actionModel();
                    },
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      size: 28,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: width * 0.94,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LayoutHelper.height5(),
              const Column(
                children: [
                  Text(
                    "I am currently looking to relocate to Washington, D.C., and am searching for a new mid-level marketing job in the city Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo........More",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
              LayoutHelper.height10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20,
                            width: 20,
                            child: Image(image: AssetImage(ImageConstant.pdf))),
                        CustomText(
                          textKey: "Resume.",
                          size: 12,
                          color: AppColors.getColor(AppColorsEnum.white),
                        )
                      ],
                    ),
                  ),
                  unVerified
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CustomText(
                            textKey: "Mark Solved",
                            size: 12,
                            color: Colors.blue,
                          ),
                        )
                      : Container()
                ],
              ),
              LayoutHelper.height5(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 12,
                      width: 12,
                      child: Image(image: AssetImage(ImageConstant.chat))),
                  LayoutHelper.width3(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: CustomText(
                      textKey: "25 Replies",
                      size: 10,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 2,
                    backgroundColor: Colors.black38,
                  ),
                  LayoutHelper.width3(),
                  CustomText(
                    textKey: "21 Feb, 2023",
                    color: Colors.black38,
                    size: 10,
                    bold: true,
                  ),
                ],
              )
            ],
          ),
        ),
        LayoutHelper.height10(),
      ],
    );
  }

  actionModel() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.8),
        context: context,
        builder: (_) {
          return Container(
            height: height * 0.24,
            decoration: BoxDecoration(
                color: HexColor("#f8f8f8"),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 9,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.getColor(AppColorsEnum.primary)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor:
                                AppColors.getColor(AppColorsEnum.primary),
                            child: CircleAvatar(
                              radius: 33,
                              backgroundColor:
                                  AppColors.getColor(AppColorsEnum.white),
                              child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(ImageConstant.edit)),
                            ),
                          ),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Edit",
                            size: 15,
                            bold: true,
                            color: AppColors.getColor(AppColorsEnum.primary),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(ImageConstant.share)),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Share",
                            size: 15,
                            bold: true,
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 33,
                              backgroundColor:
                                  AppColors.getColor(AppColorsEnum.white),
                              child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(ImageConstant.verify2)),
                            ),
                          ),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Marks Solved",
                            size: 15,
                            bold: true,
                            color: Colors.blue,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                LayoutHelper.height10()
              ],
            ),
          );
        });
  }
}
