import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/MyFeed/Feed_data.dart/feed_data.dart';
import 'package:alumni/Pages/MyFeed/UI/AddPost.dart';
import 'package:alumni/Pages/MyFeed/UI/ShareAchivements.dart';
import 'package:alumni/Pages/MyFeed/bloc.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Widgets/Widgets/custom_edit_text_white_back.dart';

class MyFeed extends StatefulWidget {
  const MyFeed({super.key});

  @override
  State<MyFeed> createState() => _MyFeedState();
}

class _MyFeedState extends State<MyFeed> {
  FeedData feedData = FeedData();

  @override
  void initState() {
    feedData.getFeedData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: HexColor("#f8f8f8"),
        child: Column(
          children: [
            Container(
              width: width,
              padding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 6, top: 0),
              color: AppColors.getColor(AppColorsEnum.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: "Feed",
                    size: 17,
                    bold: true,
                    color: Colors.black38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: height * 0.037,
                              width: width * 0.08,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.getColor(
                                      AppColorsEnum.primary)),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: AppColors.getColor(
                                      AppColorsEnum.secondaryColor),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                          ),
                          LayoutHelper.height10(),
                        ],
                      ),
                      LayoutHelper.width20(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                            height: height * 0.037,
                            width: width * 0.08,
                            child: Image(
                              image: AssetImage(ImageConstant.loveMsg),
                              fit: BoxFit.cover,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: () {
                        shareUpdate();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
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
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child:
                              Image(image: AssetImage(ImageConstant.addPhoto)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BlocProvider(
                                          create: (context) => UploadFeedBloc(),
                                          child: const AddPost(),
                                        )));
                          },
                          child: Text(
                            "Add Photo",
                            style: TextStyle(
                                color: AppColors.getColor(AppColorsEnum.black)
                                    .withOpacity(0.4),
                                fontSize: 7),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 10),
              color: AppColors.getColor(AppColorsEnum.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ShareAchivements()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.getColor(AppColorsEnum.primary),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 7, bottom: 7),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 20,
                              width: 20,
                              child: Image(
                                image: AssetImage(ImageConstant.gift),
                                fit: BoxFit.cover,
                              )),
                          CustomText(
                            textKey: "  + Share Achievement",
                            size: 10,
                            color: AppColors.getColor(AppColorsEnum.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            feedTile(),
            feedTile(isAchivmentTile: true, year: "2017-2018"),
            secontionTile(firstTitle: "Your Batchmets", isJustTitle: false),
            SizedBox(
              height: height * 0.35,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return batchmetsTile();
                  }),
            ),
            feedTile(),
            feedTile(isAchivmentTile: true, year: "2017-2018"),
            secontionTile(
                firstTitle: "Recently Shared Job Opprtunity",
                isJustTitle: false),
            LayoutHelper.height10(),
            SizedBox(
              height: height * 0.27,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return opportunitiesTile();
                  }),
            ),
            secontionTile(
                firstTitle: "Upcomming CIRS Events", isJustTitle: true),
            LayoutHelper.height5(),
            Container(
              width: width * 0.9,
              height: height * 0.18,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.teamCelebration))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: height * 0.14,
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors.getColor(AppColorsEnum.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              textKey: "Charity Event : Save Earth",
                              size: 14,
                              bold: true,
                              color: AppColors.getColor(AppColorsEnum.primary),
                            ),
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
                          ],
                        ),
                        LayoutHelper.height10(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  color:
                                      AppColors.getColor(AppColorsEnum.primary),
                                )
                              ],
                            ),
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
                                  color:
                                      AppColors.getColor(AppColorsEnum.primary),
                                )
                              ],
                            ),
                            LayoutHelper.height3(),
                          ],
                        ),
                        LayoutHelper.height10(),
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
                  )
                ],
              ),
            ),
            SizedBox(
              width: width * 0.9,
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
        ));
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];
  feedTile({bool isAchivmentTile = false, String year = ""}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                color: HexColor("#f8f8f8"),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 30,
                                width: 30,
                                child: Image(
                                    image:
                                        AssetImage(ImageConstant.sampleImage))),
                            LayoutHelper.width10(),
                            CustomText(
                              textKey: "Afreen",
                              size: 12,
                              bold: true,
                            ),
                            LayoutHelper.width10(),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 1, bottom: 1),
                              decoration: BoxDecoration(
                                  color: AppColors.getColor(
                                      AppColorsEnum.secondaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              child: CustomText(
                                textKey: isAchivmentTile ? year : "Your Batch",
                                size: 9,
                                color: AppColors.getColor(AppColorsEnum.white),
                              ),
                            )
                          ],
                        ),
                        isAchivmentTile
                            ? CustomText(
                                textKey: "+ Connect",
                                bold: true,
                                color:
                                    AppColors.getColor(AppColorsEnum.primary),
                              )
                            : Container()
                      ],
                    )
                  ],
                ),
              ),
              LayoutHelper.height5(),
              isAchivmentTile
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.getColor(
                                        AppColorsEnum.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.only(
                                    left: 11, right: 11, top: 7, bottom: 7),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                          image: AssetImage(ImageConstant.gift),
                                          fit: BoxFit.cover,
                                        )),
                                    CustomText(
                                      textKey: "  + Share Achievement",
                                      size: 10,
                                      color: AppColors.getColor(
                                          AppColorsEnum.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              LayoutHelper.height5(),
              isAchivmentTile
                  ? SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: height * 0.4,
                            width: width * 0.95,
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageConstant.winBackground),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        ImageConstant.degreeCompletion),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.getColor(
                                              AppColorsEnum.secondaryColor)),
                                      child: CustomText(
                                        textKey: "Completed M.Des Programme",
                                        color: AppColors.getColor(
                                            AppColorsEnum.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          LayoutHelper.width5(),
                          Container(
                            height: height * 0.4,
                            width: width * 0.95,
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageConstant.winBackground),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      AppColors.getColor(AppColorsEnum.white)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.getColor(
                                              AppColorsEnum.secondaryColor)),
                                      child: CustomText(
                                        textKey: "Completed M.Des Programme",
                                        color: AppColors.getColor(
                                            AppColorsEnum.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo. Et galisum reprehenderit et maxime sunt aut dolorem dolores est incidunt laborum.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: AppColors.getColor(
                                        AppColorsEnum.black,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: height * 0.4,
                      width: width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.profilePhoto),
                              fit: BoxFit.cover)),
                    ),
              LayoutHelper.height10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            AppColors.getColor(AppColorsEnum.white),
                        child: SizedBox(
                            height: 17,
                            width: 17,
                            child: Image.asset(ImageConstant.like)),
                      ),
                      LayoutHelper.width5(),
                      CustomText(
                        textKey: "Like",
                        color: Colors.black26,
                        bold: true,
                      )
                    ],
                  ),
                  const Icon(Icons.more_vert)
                ],
              ),
              LayoutHelper.height10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset(ImageConstant.liked)),
                  LayoutHelper.width5(),
                  CustomText(
                    textKey: "900 Likes",
                    color: AppColors.getColor(AppColorsEnum.primary),
                    bold: true,
                    size: 14,
                  )
                ],
              ),
              LayoutHelper.height10(),
              const Text(
                "I am Happy to share that i got Scholarship for Higher Education.... More",
                style: TextStyle(fontSize: 10),
              ),
              LayoutHelper.height10(),
              Row(
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor:
                        AppColors.getColor(AppColorsEnum.grey).withOpacity(0.5),
                  ),
                  LayoutHelper.width5(),
                  CustomText(
                    textKey: "2 days Ago",
                    color:
                        AppColors.getColor(AppColorsEnum.grey).withOpacity(0.5),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  shareUpdate() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (con) {
          return SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: height * 0.05,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 10),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 15,
                            child: SvgPicture.asset(
                              ImageConstant.cancel,
                              color: AppColors.getColor(AppColorsEnum.white),
                            ),
                            backgroundColor:
                                AppColors.getColor(AppColorsEnum.red),
                          )),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.getColor(AppColorsEnum.white),
                  height: height * 0.7,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 20, left: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              textKey: "Share Update",
                              size: 16,
                            ),
                            CustomText(
                              textKey: "Post",
                              color: AppColors.getColor(AppColorsEnum.primary),
                            )
                          ],
                        ),
                        LayoutHelper.height10(),
                        Container(
                          // height: 30,
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12)),
                          child: CustomInputField(
                              verticalContentPadding: 5,
                              horizontalContentPadding: 8,
                              borderRadius: 8,
                              maxLines: 10,
                              allBorderdisable: true,
                              hintstyle: const TextStyle(
                                  fontSize: 12, color: Colors.black12),
                              fillColor:
                                  AppColors.getColor(AppColorsEnum.white),
                              hint: "Add Text Here",
                              textEditingController: _controller),
                        ),
                        LayoutHelper.height10(),
                        SizedBox(
                          width: width * 0.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  primary: AppColors.getColor(
                                      AppColorsEnum.primary)),
                              onPressed: () {},
                              child: CustomText(
                                textKey: "Post",
                                size: 17,
                                color: AppColors.getColor(AppColorsEnum.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  final TextEditingController _controller = TextEditingController();

  batchmetsTile({bool conncted = false}) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => AlumniProfile()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 10),
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
                          offset: const Offset(0.7, 0.7),
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

  secontionTile({
    required String firstTitle,
    bool isJustTitle = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textKey: firstTitle,
                bold: true,
                color: AppColors.getColor(AppColorsEnum.black).withOpacity(0.5),
              ),
              isJustTitle
                  ? Container()
                  : SvgPicture.asset(
                      ImageConstant.arrow_,
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                    ),
            ],
          ),
        ],
      ),
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
