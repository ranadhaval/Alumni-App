import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Event/eventRegestrationForm.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/Widgets/custom_text.dart';
import '../../themeFiles/app_colors.dart';

class EventRegistration extends StatefulWidget {
  const EventRegistration({super.key});

  @override
  State<EventRegistration> createState() => _EventRegistrationState();
}

class _EventRegistrationState extends State<EventRegistration> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        bottomNavigationBar: SizedBox(
          width: width,
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                  primary: AppColors.getColor(AppColorsEnum.primary)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EventRegistrationForm()));
              },
              child: CustomText(
                textKey: "Interested",
                size: 17,
                color: AppColors.getColor(AppColorsEnum.white),
              )),
        ),
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                    color: AppColors.getColor(AppColorsEnum.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageConstant.arrowBack),
                      LayoutHelper.width10(),
                      CustomText(
                        textKey: "Charity Events",
                        size: 17,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              LayoutHelper.height10(),
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
                          Column(
                            children: [
                              const Text(
                                "Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo.Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo.Lorem ipsum dolor sit amet. Cum nostrum officiis a facilis sint nam deleniti beatae aut dolorem voluptates sit dolores illo.",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          LayoutHelper.height5(),
                          CustomText(
                            textKey: "www.Khushi//.com",
                            color: const Color.fromARGB(255, 45, 145, 227),
                          ),
                          LayoutHelper.height15(),
                          CustomText(
                            textKey: "Event Organizer",
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor),
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
                                    organizationImage:
                                        ImageConstant.organization1),
                                LayoutHelper.width15(),
                                organizationTile(
                                    organizerImage: ImageConstant.organizer2,
                                    organizerName: "Naman",
                                    organizerPosition: "NGO Head",
                                    organizationImage:
                                        ImageConstant.organization2)
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
                                  color:
                                      AppColors.getColor(AppColorsEnum.white),
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
                                              textKey:
                                                  "Sports Satdium, University",
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
                                      color: AppColors.getColor(
                                          AppColorsEnum.primary),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  List<String> image = [
    ImageConstant.avtar1,
    ImageConstant.avtar2,
    ImageConstant.avtar3,
  ];

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


}
