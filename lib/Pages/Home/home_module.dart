import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Jobs/Jobs.dart';
import 'package:alumni/Pages/Need/Need.dart';

import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';

class HomeModule extends StatefulWidget {
  const HomeModule({super.key});

  @override
  State<HomeModule> createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return     LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        key: _scaffoldKey,
        drawer: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: AppColors.getColor(AppColorsEnum.primary),
          width: width * 0.7,
          child: Column(
            children: [
              Container(
                height: height * 0.23,
                decoration: BoxDecoration(
                    color: AppColors.getColor(AppColorsEnum.primary)),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 40,
                        child: Image(
                            image: AssetImage(ImageConstant.sampleImage))),
                    LayoutHelper.height5(),
                    Text(
                      "Shreya",
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.getColor(AppColorsEnum.white)),
                    ),
                    LayoutHelper.height10(),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 7, bottom: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      ),
                      child: CustomText(
                        textKey: "View Profile",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1.5,
                color: AppColors.getColor(AppColorsEnum.secondaryColor),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                // margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "Mentors",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "CIRS Gallery",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "Events",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "Needs",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "My Batchmates",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "Saved Activities",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "My Account",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -2),
                      selected: true,
                      title: CustomText(
                        textKey: "Schedule School Visit",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: 0),
                      selected: true,
                      title: CustomText(
                        textKey: "Logout",
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: 0),
                      selected: true,
                      title: CustomText(
                        textKey: "Version 0.1",
                        color: AppColors.getColor(AppColorsEnum.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: SizedBox(
                              height: height * 0.05,
                              width: width * 0.10,
                              child: Image(
                                  image: AssetImage(
                                ImageConstant.sampleImage,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 4,
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
                                  hintstyle: const TextStyle(
                                      fontSize: 12, color: Colors.black12),
                                  fillColor:
                                      AppColors.getColor(AppColorsEnum.white),
                                  hint: "Search Alumni/ Events/ News....",
                                  textEditingController: _controller),
                            )),
                        Expanded(
                          child: SizedBox(
                            height: height * 0.04,
                            child: Image(
                                image: AssetImage(
                              ImageConstant.chatIcon,
                            )),
                          ),
                        ),
                      ],
                    ),
                    LayoutHelper.height20(),
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.getColor(AppColorsEnum.gray200)),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.getColor(AppColorsEnum.white)),
                        child: Row(
                          children: [
                            SizedBox(
                                height: height * 0.06,
                                child: Image(
                                  image: AssetImage(
                                    ImageConstant.institueLogo,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                            LayoutHelper.width10(),
                            CustomText(
                              textKey: "Share your Updates with us",
                              color: AppColors.getColor(AppColorsEnum.black)
                                  .withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                    LayoutHelper.height10(),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _addBox(title: "My Games"),
                        _addBox(
                            title: "Needs",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Need(
                                            isAdded: false,
                                          )));
                            }),
                        _addBox(
                            height_: 0.058,
                            width_: 0.12,
                            radius: 35,
                            padding: 10,
                            space: 10,
                            topPadding: 5,
                            title: "Create Post"),
                        _addBox(
                            title: "Jobs",
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => JobsAdd()));
                            }),
                        _addBox(
                            title: "Activities",
                            isNotification: true,
                            padding: 3),
                      ],
                    ),
                  ),
                ],
              ),
              LayoutHelper.height20(),
              secontionTile(
                  firstTitle: "Upcoming Events", secondTitle: "Explore"),
              LayoutHelper.height5(),
              SizedBox(
                height: height * 0.42,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _evetTile();
                    }),
              ),
              LayoutHelper.height10(),
              secontionTile(
                  firstTitle: "Alumni Need's", secondTitle: "View All"),
              LayoutHelper.height10(),
              SizedBox(
                height: height * 0.155,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return alumniNeedTile();
                    }),
              ),
              LayoutHelper.height10(),
              secontionTile(firstTitle: "Groups", secondTitle: "Explore"),
              LayoutHelper.height5(),
              SizedBox(
                height: height * 0.38,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return groupTile();
                    }),
              ),
              secontionTile(
                firstTitle: "Opportunities",
              ),
              LayoutHelper.height5(),
              SizedBox(
                height: height * 0.28,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return opportunitiesTile();
                    }),
              ),
            ],
          ),
        ));
 
  }



  _addBox(
      {double height_ = 0.045,
      double width_ = 0.085,
      double padding = 7,
      double topPadding = 10,
      double radius = 8,
      required String title,
      double space = 15,
      bool isNotification = false,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
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
                  color: AppColors.getColor(AppColorsEnum.primary)),
              child: Center(
                child: isNotification
                    ? Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image(
                            image: AssetImage(ImageConstant.notification)),
                      )
                    : CircleAvatar(
                        backgroundColor:
                            AppColors.getColor(AppColorsEnum.secondaryColor),
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

  _evetTile() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          height: height * 0.34,
          width: width * 0.46,
          decoration: BoxDecoration(
              color: AppColors.getColor(AppColorsEnum.black),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  repeat: ImageRepeat.noRepeat,
                  image: AssetImage(ImageConstant.image1),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: height * 0.17,
                width: width,
                decoration: BoxDecoration(
                  color: AppColors.getColor(AppColorsEnum.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textKey: "Charity Event : Save Earth",
                      size: 10,
                      bold: true,
                      color: AppColors.getColor(AppColorsEnum.primary),
                    ),
                    LayoutHelper.height5(),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 4, right: 3, bottom: 3, top: 3),
                      decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
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
                              color: AppColors.getColor(AppColorsEnum.white),
                            ),
                          ),
                          LayoutHelper.width5(),
                        ],
                      ),
                    ),
                    LayoutHelper.height3(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 17,
                        ),
                        LayoutHelper.width5(),
                        CustomText(
                          textKey: "Sports Satdium, University",
                          size: 8,
                          bold: true,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        )
                      ],
                    ),
                    LayoutHelper.height3(),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_filled_rounded,
                          size: 17,
                        ),
                        LayoutHelper.width5(),
                        CustomText(
                          textKey: "10 a.m. - 5:00 p.m.",
                          size: 8,
                          bold: true,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        )
                      ],
                    ),
                    LayoutHelper.height3(),
                    SizedBox(
                      height: height * 0.02,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          for (int i = 0; i < 3; i++)
                            Align(
                              widthFactor: 0.5,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 8,
                                child: CircleAvatar(
                                  radius: 7,
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
                          )
                        ],
                      ),
                    ),
                    LayoutHelper.height3(),
                    Row(
                      children: [
                        LayoutHelper.width5(),
                        CustomText(
                          textKey: "Attending Event",
                          size: 10,
                          bold: true,
                          color:
                              AppColors.getColor(AppColorsEnum.secondaryColor),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: width * 0.46,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: AppColors.getColor(AppColorsEnum.primary)),
              onPressed: () {},
              child: CustomText(
                textKey: "Interested",
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        )
      ],
    );
  }

  secontionTile({required String firstTitle, String secondTitle = ""}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textKey: firstTitle,
                bold: true,
                color: Colors.black54,
              ),
              secondTitle.isNotEmpty
                  ? Row(
                      children: [
                        CustomText(
                          textKey: secondTitle,
                          bold: true,
                          color:
                              AppColors.getColor(AppColorsEnum.secondaryColor),
                        ),
                        LayoutHelper.width5(),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color:
                              AppColors.getColor(AppColorsEnum.secondaryColor),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];
  final TextEditingController _controller = TextEditingController();


  
  alumniNeedTile() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
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
    );
  }


  groupTile() {
    return Column(
      children: [
        Container(
          height: height * 0.3,
          width: width * 0.45,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0.4, 0.4),
                    spreadRadius: 0.5,
                    color: Colors.grey.shade400)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.5,
                height: height * 0.15,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.groupBackground),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.getColor(
                          AppColorsEnum.primary,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: CustomText(
                        textKey: "Created by: Mentors",
                        size: 8,
                        bold: true,
                        color: AppColors.getColor(
                          AppColorsEnum.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              CustomText(
                textKey: "Career Guidance",
                size: 12,
                bold: true,
                color: AppColors.getColor(
                  AppColorsEnum.primary,
                ),
              ),
              LayoutHelper.height5(),
              Column(
                children: [
                  const Text(
                    "Share your career requirements we will help you to find right path for your professional development",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  )
                ],
              ),
              LayoutHelper.height3(),
              SizedBox(
                height: height * 0.02,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    for (int i = 0; i < 3; i++)
                      Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 8,
                          child: CircleAvatar(
                            radius: 7,
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
                    )
                  ],
                ),
              ),
              LayoutHelper.height3(),
              Row(
                children: [
                  LayoutHelper.width5(),
                  CustomText(
                    textKey: "Members",
                    size: 10,
                    bold: true,
                    color: AppColors.getColor(AppColorsEnum.secondaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.44,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: AppColors.getColor(AppColorsEnum.secondaryColor)),
              onPressed: () {},
              child: CustomText(
                textKey: "Request to Join",
                textAlign: TextAlign.center,
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        )
      ],
    );
  }

  opportunitiesTile() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          width: width * 0.45,
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
                    child: Image(image: AssetImage(ImageConstant.accenture)),
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
              LayoutHelper.height5(),
              richtext(firstTitle: "Role: ", secondTitle: "Graphic Designer"),
              richtext(firstTitle: "Experience: ", secondTitle: "3-4 Years"),
              richtext(
                  firstTitle: "Banglore, India ",
                  secondTitle: "(Remote)",
                  secondTitleColor: AppColors.getColor(AppColorsEnum.primary)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: "1 Week Ago",
                    size: 11,
                  ),
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
          width: width * 0.44,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: AppColors.getColor(AppColorsEnum.primary)),
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: AppColors.getColor(AppColorsEnum.white)),
              onPressed: () {},
              child: CustomText(
                textKey: "Apply",
                size: 17,
                color: AppColors.getColor(AppColorsEnum.primary),
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