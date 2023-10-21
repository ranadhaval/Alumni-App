import 'package:alumni/Blocs/HomeBloc/HomeState/home_state.dart';
import 'package:alumni/Blocs/HomeBloc/home_bloc.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlumniProfile extends StatefulWidget {
  const AlumniProfile({super.key});
  @override
  State<AlumniProfile> createState() => _AlumniProfileState();
}

class _AlumniProfileState extends State<AlumniProfile> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: BlocConsumer<HomeBloc, HomeMainState>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            return body(state);
          },
        ));
  }

  body(state) {
    HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    return (state is HomeViewProfileLoadingState ||
            state is HomeViewProfileInitialState)
        ? Container(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CustomText(
                            textKey: "Your choosen profile is loading .... "),
                        CustomText(textKey: "Please wait "),
                      ],
                    ),
                    LayoutHelper.width10(),
                    Container(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  ],
                )),
              ],
            ),
          )
        : (state is HomeViewProfileSuccessState)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.07,
                    color: AppColors.getColor(AppColorsEnum.primary),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.arrowBack,
                                  color:
                                      AppColors.getColor(AppColorsEnum.white),
                                ),
                                LayoutHelper.width10(),
                                CustomText(
                                  textKey: homeBloc.viewProfileData
                                      .viewAlumniProfileRes.data!.firstName
                                      .toString(),
                                  color:
                                      AppColors.getColor(AppColorsEnum.white),
                                ),
                                LayoutHelper.width15(),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.getColor(
                                        AppColorsEnum.secondaryColor),
                                  ),
                                  child: CustomText(
                                    textKey: "Your Batch",
                                    color:
                                        AppColors.getColor(AppColorsEnum.white),
                                    size: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.more_vert_sharp,
                                size: 30,
                                color: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.435,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.25,
                          child: Stack(
                            children: [
                              Container(
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ImageConstant.profileBackground),
                                        fit: BoxFit.cover),
                                    color: AppColors.getColor(
                                        AppColorsEnum.secondaryColor)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage(ImageConstant.sampleImage),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textKey: homeBloc.viewProfileData
                                    .viewAlumniProfileRes.data!.firstName
                                    .toString(),
                                size: 15,
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              ),
                              CustomText(
                                textKey: "Graphic Designer",
                                size: 14,
                                color: Colors.black45,
                              ),
                              LayoutHelper.height5(),
                              Row(
                                children: [
                                  Container(
                                      height: height * 0.018,
                                      child: Image(
                                          image: AssetImage(
                                              ImageConstant.accenture))),
                                  LayoutHelper.width10(),
                                  CustomText(
                                    textKey: "Accenture",
                                    size: 13,
                                    color: Colors.black45,
                                    bold: true,
                                  ),
                                ],
                              ),
                              LayoutHelper.height5(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 20,
                                  ),
                                  LayoutHelper.width5(),
                                  CustomText(
                                    textKey: "Delhi",
                                    size: 13,
                                    bold: true,
                                    color: AppColors.getColor(
                                        AppColorsEnum.primary),
                                  )
                                ],
                              ),
                              LayoutHelper.height5(),
                              CustomText(
                                textKey:
                                    "Passing Year : ${homeBloc.viewProfileData.viewAlumniProfileRes.data!.userDetails!.passingYear.toString()}",
                                size: 13,
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              ),
                              LayoutHelper.height5(),
                              InkWell(
                                onTap: () {},
                                child: CustomText(
                                  textKey: "900 connections",
                                  size: 12,
                                  color: AppColors.getColor(
                                      AppColorsEnum.secondaryColor),
                                  bold: true,
                                ),
                              ),
                              LayoutHelper.height5(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.01,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  Container(
                    height: height * 0.38,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutHelper.height5(),
                          CustomText(
                            textKey: "About Me",
                            bold: true,
                            color: AppColors.getColor(
                              AppColorsEnum.primary,
                            ),
                          ),
                          LayoutHelper.height5(),
                          Text(
                            "My Profession details, my goals and achievements, My hobbies, Motivation and learnings",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ),
                          LayoutHelper.height10(),
                          secontionTile(firstTitle: "Shared Achivements"),
                          LayoutHelper.height10(),
                          SizedBox(
                            height: height * 0.25,
                            width: width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.21,
                                      width: width * 0.43,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: AssetImage(ImageConstant
                                                  .achivementBackground),
                                              fit: BoxFit.cover)),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4, right: 4),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey
                                                        .withOpacity(0.6)),
                                                child: CustomText(
                                                  textKey:
                                                      "Posted on: 12 Jan, 2022",
                                                  color: AppColors.getColor(
                                                      AppColorsEnum.white),
                                                  size: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: SvgPicture.asset(
                                                ImageConstant
                                                    .gradientAchivement,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 10),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                "Today I got Selected as College representative for upcoming National Event",
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: AppColors.getColor(
                                                        AppColorsEnum.white)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    LayoutHelper.height5(),
                                    Container(
                                      width: width * 0.43,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            textKey: "View Post",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.getColor(
                                                    AppColorsEnum.primary),
                                                fontSize: 12),
                                          ),
                                          LayoutHelper.width5(),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 14,
                                            color: AppColors.getColor(
                                                AppColorsEnum.primary),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                LayoutHelper.width10(),
                                Column(
                                  children: [
                                    Container(
                                      height: height * 0.21,
                                      width: width * 0.43,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0.2, 0.2),
                                              spreadRadius: 0.5,
                                              color: Colors.black38,
                                            )
                                          ]),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4, right: 4),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.grey
                                                          .withOpacity(0.6)),
                                                  child: CustomText(
                                                    textKey:
                                                        "Posted on: 12 Jan, 2022",
                                                    color: AppColors.getColor(
                                                        AppColorsEnum.white),
                                                    size: 8,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          LayoutHelper.height10(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Text(
                                              "I am Happy to share that I had cleared my scholarship exam and get full scholarship for my further studies in .....Institute Thisand get full scholarship for my further studies in ",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    LayoutHelper.height5(),
                                    Container(
                                      width: width * 0.43,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            textKey: "View Post",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.getColor(
                                                    AppColorsEnum.primary),
                                                fontSize: 12),
                                          ),
                                          LayoutHelper.width5(),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 14,
                                            color: AppColors.getColor(
                                                AppColorsEnum.primary),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  LayoutHelper.height10(),
                  Container(
                    height: height * 0.01,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Column(
                      children: [
                        secontionTile(
                            firstTitle: "Experience", isJustTitle: true),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            LayoutHelper.height10(),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 20),
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 27,
                                          child: SizedBox(
                                              height: height * 0.027,
                                              width: width * 0.15,
                                              child: Image(
                                                  image: AssetImage(
                                                      ImageConstant
                                                          .accenture))),
                                        ),
                                        LayoutHelper.height5(),
                                      ],
                                    ),
                                    LayoutHelper.width10(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Microsoft",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        LayoutHelper.height5(),
                                        const Text(
                                          "Hyderabad, india",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        LayoutHelper.height5(),
                                        const Text(
                                          "12 Jan, 23 - Present",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    LayoutHelper.width10(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Design Intern",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        LayoutHelper.height5(),
                                        const Text(
                                          "Remote",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        LayoutHelper.height5(),
                                        const Text(
                                          "Full Time",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            ),
                            LayoutHelper.height5(),
                            LayoutHelper.height5(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                              ),
                              child: CustomText(
                                textKey: "2 Months",
                                color: AppColors.getColor(AppColorsEnum.white),
                                size: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  LayoutHelper.height10(),
                  Container(
                    height: height * 0.01,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Column(
                      children: [
                        secontionTile(
                            firstTitle: "Education", isJustTitle: true),
                      ],
                    ),
                  ),
                  LayoutHelper.height10(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      width: width,
                      decoration: BoxDecoration(
                          color: AppColors.getColor(AppColorsEnum.primary),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.35,
                              decoration: BoxDecoration(
                                  color: AppColors.getColor(
                                      AppColorsEnum.secondaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  LayoutHelper.width10(),
                                  SizedBox(
                                    height: height * 0.037,
                                    width: width * 0.05,
                                    child: Image(
                                        image: AssetImage(
                                      ImageConstant.institueLogo,
                                    )),
                                  ),
                                  LayoutHelper.width5(),
                                  Text(
                                    "CIRS Education",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.getColor(
                                          AppColorsEnum.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            LayoutHelper.height5(),
                            Column(
                              children: [
                                _standerdTile(
                                    titleFirst: "9th Standard (78)",
                                    titleSecond: "2019-2020"),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  LayoutHelper.height10(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10, top: 5),
                      decoration: BoxDecoration(
                          color: AppColors.getColor(AppColorsEnum.white),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.4, 0.4),
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.6)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // width: width * 0.35,
                            decoration: BoxDecoration(
                                color: AppColors.getColor(
                                    AppColorsEnum.secondaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LayoutHelper.width5(),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "School of Arts, india, Punjab",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.getColor(
                                          AppColorsEnum.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          LayoutHelper.height10(),
                          _standerdTile(
                              isOtherEducationTile: true,
                              titleFirst: "Bachelors in Design",
                              titleSecond: "2018-2020"),
                        ],
                      ),
                    ),
                  ),
                  LayoutHelper.height15(),
                  Container(
                    height: height * 0.01,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  LayoutHelper.height5(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [secontionTile(firstTitle: "Needs (3)")],
                    ),
                  ),
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
                  LayoutHelper.height15(),
                  Container(
                    color: Colors.grey.withOpacity(0.18),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Column(
                            children: [
                              secontionTile(
                                  firstTitle: "Joined Group (2)",
                                  isJustTitle: true)
                            ],
                          ),
                        ),
                        LayoutHelper.height5(),
                        SizedBox(
                          height: height * 0.38,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(left: 17),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return groupTile();
                              }),
                        ),
                      ],
                    ),
                  ),
                  // LayoutHelper.height5(),
                  Container(
                    color: Colors.grey.withOpacity(0.18),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: Column(
                            children: [
                              secontionTile(
                                  firstTitle: "Upcoming Joined Events",
                                  isJustTitle: true)
                            ],
                          ),
                        ),
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
                      ],
                    ),
                  )
                ],
              )
            : Container(
                height: height,
                width: width,
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
  }

  secontionTile({
    required String firstTitle,
    bool isJustTitle = false,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: firstTitle,
              bold: true,
              color: AppColors.getColor(AppColorsEnum.primary),
            ),
            isJustTitle
                ? Container()
                : SvgPicture.asset(
                    ImageConstant.arrow_,
                    color: AppColors.getColor(AppColorsEnum.primary),
                  ),
          ],
        ),
      ],
    );
  }

  _standerdTile(
      {bool isOtherEducationTile = false,
      required String titleFirst,
      required String titleSecond,
      Color? Textcolor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleFirst,
              style: TextStyle(
                  fontSize: 15,
                  color: isOtherEducationTile
                      ? Textcolor
                      : AppColors.getColor(AppColorsEnum.white))),
          Row(
            children: [
              Text(titleSecond,
                  style: TextStyle(
                      fontSize: 15,
                      color: isOtherEducationTile
                          ? Textcolor
                          : AppColors.getColor(AppColorsEnum.white))),
              LayoutHelper.width10(),
            ],
          )
        ],
      ),
    );
  }

  alumniNeedTile() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: width * 0.85,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade300,
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
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        )
      ],
    );
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];

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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: const EdgeInsets.only(
                        left: 4, right: 3, bottom: 3, top: 3),
                    decoration: BoxDecoration(
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LayoutHelper.width5(),
                        Text(
                          "Upcoming",
                          style: TextStyle(
                            fontSize: 9,
                            color: AppColors.getColor(AppColorsEnum.white),
                          ),
                        ),
                        LayoutHelper.width5(),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                          color:
                              AppColors.getColor(AppColorsEnum.secondaryColor),
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
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: width * 0.46,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
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
}
