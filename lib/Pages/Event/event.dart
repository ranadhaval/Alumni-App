import 'package:alumni/Pages/Event/eventRegistrationPage.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Constants/image_constant.dart';
import '../../Widgets/Widgets/custom_text.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> with SingleTickerProviderStateMixin {
  @override
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
              height: 50,
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
                    textKey: "All Events",
                    size: 17,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    controller: controller,
                    tabs: [Text("All events"), Text("My Events")])),
            Container(
                height: height * 0.8,
                child: TabBarView(
                    physics: ScrollPhysics(),
                    controller: controller,
                    children: [
                      SizedBox(
                        height: height * 0.25,
                        child: ListView.builder(itemBuilder: (context, index) {
                          return eventTile();
                        }),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      textKey: "Upcomming Event",
                                      bold: true,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.7,
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              mainAxisSpacing: 20,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 15),
                              itemCount: 15,
                              staggeredTileBuilder: (index) {
                                return const StaggeredTile.fit(1);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return _evetTile(
                                    getmessage: index == 1 || index == 2);
                              },
                            ),
                          ),
                        ],
                      ),
                    ]))
          ],
        ));
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];
  TabController? controller;

  eventTile() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const EventRegistration()));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: height * 0.04,
                      width: width * 0.08,
                      child: Image(
                        image: AssetImage(
                          ImageConstant.institueLogo,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    LayoutHelper.width10(),
                    CustomText(
                      textKey: "Charity Event : Save Earth",
                      size: 12,
                      bold: true,
                      color: AppColors.getColor(AppColorsEnum.primary),
                    ),
                  ],
                ),
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
              ],
            ),
          ),
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
                      SizedBox(
                        height: height * 0.02,
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
                            Icon(
                              Icons.share,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor),
                            )
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
                      Column(
                        children: [
                          const Text(
                            "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo. ........Read More",
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 12,
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
      ),
    );
  }

  _evetTile({required bool getmessage}) {
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
                  image: AssetImage(ImageConstant.teamCelebration),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Column(
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
                                  color:
                                      AppColors.getColor(AppColorsEnum.white),
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
                  )
                ],
              ),
              getmessage
                  ? Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Stack(
                            children: [
                              Image(
                                  image: AssetImage(ImageConstant.bigChatIcon)),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, right: 5),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: AppColors.getColor(
                                        AppColorsEnum.primary),
                                    child: Center(
                                      child: CustomText(
                                        textKey: "1",
                                        size: 7,
                                        bold: true,
                                        color: AppColors.getColor(
                                            AppColorsEnum.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  : Container()
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
                textKey: "View Detail",
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        )
      ],
    );
  }
}
