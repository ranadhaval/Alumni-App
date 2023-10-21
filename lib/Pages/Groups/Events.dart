import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: Container(
          height: height,
          child: Column(
            children: [
                  Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      textKey: "Delhi Events (2)",
                      color: AppColors.getColor(AppColorsEnum.secondaryColor),
                    ),
                    CustomText(
                      textKey: "+Add Events",
                      color: AppColors.getColor(AppColorsEnum.primary),
                    ),
                  ],
                ),
              ),
           
              SizedBox(
                height: height * 0.8,
                child: ListView.builder(itemBuilder: (context, index) {
                  return eventTile();
                }),
              ),
            ],
          ),
        ));
  }

  eventTile() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      textKey: "Shared by:  ",
                      size: 11,
                      color: Colors.black38,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(ImageConstant.archit),
                        ),
                        LayoutHelper.width5(),
                        CustomText(
                          textKey: "Archit",
                          size: 11,
                          color: AppColors.getColor(AppColorsEnum.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                  textKey: "Register Now",
                  size: 17,
                  color: AppColors.getColor(AppColorsEnum.white),
                )),
          )
        ],
      ),
    );
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];
}
