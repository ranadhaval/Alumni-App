import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Widgets/Widgets/custom_edit_text_white_back.dart';

class OrganizerAndOtherParticipants extends StatefulWidget {
  const OrganizerAndOtherParticipants({super.key});

  @override
  State<OrganizerAndOtherParticipants> createState() =>
      _OrganizerAndOtherParticipantsState();
}

class _OrganizerAndOtherParticipantsState
    extends State<OrganizerAndOtherParticipants> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: SizedBox(
          height: height * 0.957,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    height: 50,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.white),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            offset: Offset(0, 4),
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Column(
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
                                  SizedBox(
                                      child: SvgPicture.asset(
                                    ImageConstant.arrowBack,
                                  )),
                                  LayoutHelper.width10(),
                                  CustomText(
                                    textKey: "Charity Events",
                                    size: 17,
                                    color: AppColors.getColor(
                                        AppColorsEnum.primary),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    eventInfo();
                                  },
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
                                  onTap: () {
                                    actionModel();
                                  },
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
                  Container(
                    height: height * 0.2,
                    color: Colors.grey.withOpacity(0.05),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Container(
                                height: height * 0.17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ImageConstant.teamCelebration2),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                        ),
                        LayoutHelper.width15(),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textKey: "Charity Event : Save Earth",
                                size: 12,
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              ),
                              LayoutHelper.height5(),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 3, bottom: 3, top: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.getColor(
                                      AppColorsEnum.secondaryColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                        child: Icon(
                                      Icons.calendar_month,
                                      size: 17,
                                    )),
                                    LayoutHelper.width5(),
                                    Text(
                                      "12 March 2023",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: AppColors.getColor(
                                            AppColorsEnum.white),
                                      ),
                                    ),
                                    LayoutHelper.width5(),
                                  ],
                                ),
                              ),
                              LayoutHelper.height5(),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 17,
                                  ),
                                  LayoutHelper.width5(),
                                  CustomText(
                                    textKey: "Sports Satdium, University",
                                    size: 10,
                                    bold: true,
                                    color: AppColors.getColor(
                                        AppColorsEnum.primary),
                                  )
                                ],
                              ),
                              LayoutHelper.height5(),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_filled_rounded,
                                    size: 17,
                                  ),
                                  LayoutHelper.width5(),
                                  CustomText(
                                    textKey: "10 a.m. - 5:00 p.m.",
                                    size: 10,
                                    bold: true,
                                    color: AppColors.getColor(
                                        AppColorsEnum.primary),
                                  )
                                ],
                              ),
                              LayoutHelper.height5(),
                              SizedBox(
                                height: height * 0.017,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                backgroundImage:
                                                    AssetImage(image[i]),
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
                                          color: AppColors.getColor(
                                                  AppColorsEnum.black)
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
                  ),
                  Container(
                    height: 8,
                    color: Colors.grey.withOpacity(0.15),
                  ),
                  LayoutHelper.height10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 1, bottom: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.getColor(AppColorsEnum.gray200)),
                        child: CustomText(
                          textKey: "Today",
                          size: 15,
                        ),
                      )
                    ],
                  ),
                  !letsChat
                      ? Column(
                          children: [
                            LayoutHelper.height40(),
                            LayoutHelper.height40(),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image(
                                image: AssetImage(ImageConstant.bigChatIcon),
                              ),
                            ),
                            LayoutHelper.height10(),
                            SizedBox(
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Text(
                                    "Connect With Event Organizers for any querry",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            LayoutHelper.height20(),
                            Container(
                              height: 30,
                              width: width * 0.35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    letsChat = true;
                                  });
                                },
                                child: Text(
                                  "Got it",
                                  style: TextStyle(
                                      color: AppColors.getColor(
                                          AppColorsEnum.white)),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.getColor(
                                        AppColorsEnum.primary),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            chatsample(),
                            chatsample(
                                isSender: true,
                                senderImage: ImageConstant.msg2),
                            chatsample(),
                            chatsample(
                                isSender: true,
                                senderImage: ImageConstant.msg2),
                          ],
                        )
                ],
              ),
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
                                border: Border.all(color: Colors.black12)),
                            child: CustomInputField(
                                verticalContentPadding: 10,
                                horizontalContentPadding: 10,
                                borderRadius: 8,
                                maxLines: 10,
                                allBorderdisable: true,
                                prefixWidget: Container(
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                          image: AssetImage(
                                            ImageConstant.paperClip,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Icon(
                                        Icons.mic,
                                        size: 27,
                                      )
                                    ],
                                  ),
                                ),
                                hintstyle: const TextStyle(
                                    fontSize: 15, color: Colors.black38),
                                fillColor:
                                    AppColors.getColor(AppColorsEnum.white),
                                hint: "Messaggio",
                                textEditingController: controller),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  bool letsChat = false;
  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];
  TextEditingController controller = TextEditingController();

  chatsample({bool isSender = false, String? senderImage}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isSender
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(senderImage ?? ImageConstant.msg1),
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.65,
                  child: BubbleSpecialOne(
                    text:
                        'Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis',
                    isSender: isSender,
                    color: isSender
                        ? AppColors.getColor(AppColorsEnum.secondaryColor)
                            .withOpacity(0.2)
                        : HexColor("#f5eaff"),
                    textStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSender
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(senderImage ?? ImageConstant.msg1),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  eventInfo() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (con) {
          return Container(
            height: height * 0.9,
            color: AppColors.getColor(AppColorsEnum.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutHelper.height15(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 7,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.getColor(AppColorsEnum.primary)),
                        )
                      ],
                    ),
                    LayoutHelper.height15(),
                    CustomText(
                      textKey: "Event Info",
                      size: 17,
                      bold: true,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                    ),
                    Container(
                      height: height * 0.18,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage(ImageConstant.teamCelebration))),
                    ),
                    LayoutHelper.height10(),
                    Text(
                        "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo.Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo.Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo."),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          textKey: "Event Organizer",
                          size: 14,
                          bold: true,
                          color:
                              AppColors.getColor(AppColorsEnum.secondaryColor),
                        ),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(ImageConstant.chatOption)),
                      ],
                    ),
                    LayoutHelper.height20(),
                    Container(
                      height: height * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          organizationTile(
                              organizerImage: ImageConstant.organizer1,
                              organizerName: "Srishti",
                              organizerPosition: "NGO Head",
                              organizationImage: ImageConstant.organization1),
                          LayoutHelper.width15(),
                          organizationTile(
                              organizerImage: ImageConstant.organizer2,
                              organizerName: "Naman",
                              organizerPosition: "NGO Head",
                              organizationImage: ImageConstant.organization2)
                        ],
                      ),
                    ),
                    CustomText(
                      textKey: "Event info.",
                      color: AppColors.getColor(AppColorsEnum.grey),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          // height: height * 0.14,
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.getColor(AppColorsEnum.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LayoutHelper.height10(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                        size: 17,
                                      ),
                                      LayoutHelper.width5(),
                                      CustomText(
                                        textKey: "12 March, 2023",
                                        size: 10,
                                        bold: true,
                                        color: AppColors.getColor(
                                            AppColorsEnum.primary),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 17,
                                      ),
                                      LayoutHelper.width5(),
                                      CustomText(
                                        textKey: "Sports Satdium, University",
                                        size: 10,
                                        bold: true,
                                        color: AppColors.getColor(
                                            AppColorsEnum.primary),
                                      )
                                    ],
                                  ),
                                  LayoutHelper.height3(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time_filled_rounded,
                                size: 17,
                              ),
                              LayoutHelper.width5(),
                              CustomText(
                                textKey: "10 a.m. - 5:00 p.m.",
                                size: 10,
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    LayoutHelper.height10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          textKey: "45 Participants",
                          size: 15,
                          bold: true,
                          color: AppColors.getColor(AppColorsEnum.grey),
                        ),
                        Row(
                          children: [
                            CustomText(
                              textKey: "View All",
                              size: 15,
                              bold: true,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor),
                            ),
                            LayoutHelper.width5(),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: SvgPicture.asset(
                                ImageConstant.arrow_,
                                color: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    LayoutHelper.height10(),
                    SizedBox(
                      height: height * 0.35,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return batchmetsTile();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  actionModel() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white.withOpacity(0.8),
        context: context,
        builder: (_) {
          return Container(
            height: height * 0.22,
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
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(ImageConstant.action1)),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Left Event",
                            size: 15,
                            bold: true,
                            color: AppColors.getColor(AppColorsEnum.red),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(ImageConstant.action2)),
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
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(ImageConstant.action3)),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Set Reminder",
                            size: 15,
                            bold: true,
                            color: AppColors.getColor(AppColorsEnum.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  organizationTile(
      {required String organizerImage,
      required String organizerName,
      required String organizerPosition,
      required String organizationImage}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(organizerImage),
        ),
        CustomText(
          textKey: organizerName,
          size: 13,
          color: AppColors.getColor(AppColorsEnum.secondaryColor),
        ),
        CustomText(
          textKey: organizerPosition,
          size: 10,
          color: AppColors.getColor(AppColorsEnum.black),
        ),
        LayoutHelper.height10(),
        SizedBox(
          height: 20,
          // width: ,
          child: Image(
            image: AssetImage(organizationImage),
          ),
        )
      ],
    );
  }

  batchmetsTile({bool conncted = false}) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => AlumniProfile()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, bottom: 10),
        height: height * 0.33,
        width: width * 0.43,
        // color: Colors.amber,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height * 0.3,
                width: width * 0.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0.7, 0.7),
                          spreadRadius: 0.3,
                          blurStyle: BlurStyle.inner,
                          blurRadius: 0.8,
                          color: Colors.grey.shade400)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 35,
                        child: Image(
                            image: AssetImage(ImageConstant.sampleImage))),
                    CustomText(
                      textKey: "Srishti",
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Graphic Designing",
                      color: Colors.black45,
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Collage of Arts, Delhi",
                      color: Colors.black45,
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
                    CustomText(
                      textKey: "Strudent",
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      bold: true,
                      size: 10,
                    ),
                    LayoutHelper.height5(),
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
                ),
              ),
            ),
            conncted
                ? Padding(
                    padding: const EdgeInsets.only(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: CustomText(
                          textKey: "Connected",
                          color: AppColors.getColor(AppColorsEnum.white),
                          size: 8,
                        ),
                      ),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 7, bottom: 7),
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
            )
          ],
        ),
      ),
    );
  }
}
