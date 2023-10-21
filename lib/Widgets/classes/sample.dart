// import 'package:alumni/Constants/arrays.dart';
// import 'package:alumni/Constants/image_constant.dart';
// import 'package:alumni/Constants/strings.dart';
// import 'package:alumni/Widgets/Widgets/custom_text.dart';
// import 'package:alumni/Widgets/classes/widget_helper_class.dart';
// import 'package:alumni/themeFiles/app_colors.dart';
// import 'package:alumni/themeFiles/layout_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// formHeader({required double progressRate}) {
//   return Column(
//     children: [
//       CustomText(
//         textKey: AppStrings.createProfile,
//         bold: true,
//         size: 22,
//         color: AppColors.getColor(AppColorsEnum.primary),
//       ),
//       Container(
//         height: 8,
//         margin: const EdgeInsets.only(
//           left: 10,
//           right: 10,
//         ),
//         decoration: BoxDecoration(
//             color: AppColors.getColor(AppColorsEnum.secondaryColor),
//             borderRadius: BorderRadius.circular(50)),
//         child: Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: LinearProgressIndicator(
//             color: AppColors.getColor(AppColorsEnum.primary),
//             value: progressRate,
//             backgroundColor: AppColors.getColor(AppColorsEnum.secondaryColor),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CustomText(
//               textKey: AppStrings.personalDetails,
//               // bold: true,
//               size: 12,
//             ),
//             CustomText(
//               textKey: AppStrings.education,
//               size: 12,
//             ),
//             CustomText(
//               textKey: AppStrings.personalInfo,
//               size: 12,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// standerdTile(
//     {bool isOtherEducationTile = false,
//     required String titleFirst,
//     required String titleSecond,
//     Color? textcolor}) {
//   return Padding(
//     padding: const EdgeInsets.only(top: 5),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(titleFirst,
//             style: TextStyle(
//                 fontSize: 15,
//                 color: isOtherEducationTile
//                     ? textcolor
//                     : AppColors.getColor(AppColorsEnum.white))),
//         Row(
//           children: [
//             Text(titleSecond,
//                 style: TextStyle(
//                     fontSize: 15,
//                     color: isOtherEducationTile
//                         ? textcolor
//                         : AppColors.getColor(AppColorsEnum.white))),
//             LayoutHelper.width10(),
//             isOtherEducationTile
//                 ? const SizedBox()
//                 : CircleAvatar(
//                     radius: 10,
//                     backgroundColor:
//                         AppColors.getColor(AppColorsEnum.secondaryColor),
//                     child: SvgPicture.asset(
//                       ImageConstant.cancel,
//                       color: AppColors.getColor(AppColorsEnum.white),
//                     ),
//                   )
//           ],
//         )
//       ],
//     ),
//   );
// }

// yesNoButton(
//     {required int index,
//     required String title,
//     void Function()? onTap,
//     required int yes}) {
//   return Expanded(
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
//         decoration: BoxDecoration(
//             boxShadow: const [
//               BoxShadow(offset: Offset(0.4, 0.4), color: Colors.grey)
//             ],
//             borderRadius: BorderRadius.circular(5),
//             color: yes == index
//                 ? AppColors.getColor(AppColorsEnum.primary)
//                 : AppColors.getColor(AppColorsEnum.white)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                   color: yes == index
//                       ? AppColors.getColor(AppColorsEnum.white)
//                       : AppColors.getColor(AppColorsEnum.secondaryColor)),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// addCIRSBottomSheet(
//     {required BuildContext context,
//     required String? form2String1,
//     required String? form2String2,
//     required String? form2String3,
//     required String? form2String4,
//     required String? form2String41}) {
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       backgroundColor: AppColors.getColor(AppColorsEnum.white),
//       builder: (context) {
//         return Builder(builder: (context) {
//           return StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return SizedBox(
//               height: MediaQuery.of(context).size.height * 0.6,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   LayoutHelper.height10(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 6,
//                         width: width * 0.45,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: AppColors.getColor(AppColorsEnum.primary)),
//                       )
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25, right: 25),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         LayoutHelper.height30(),
//                         CustomText(
//                           textKey: "Add CIRS Classes",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.getColor(
//                                   AppColorsEnum.secondaryColor)),
//                         ),
//                         LayoutHelper.height15(),
//                         const Text(
//                           AppStrings.yourPassingClass,
//                           style: TextStyle(fontSize: 12),
//                         ),
//                         LayoutHelper.height5(),
//                         // Container(
//                         //   padding: const EdgeInsets.only(
//                         //       left: 10, right: 10, bottom: 10, top: 7),
//                         //   decoration: BoxDecoration(
//                         //       borderRadius: BorderRadius.circular(7),
//                         //       color: AppColors.getColor(AppColorsEnum.primary)),
//                         //   child: standerdTile(
//                         //       textcolor:
//                         //           AppColors.getColor(AppColorsEnum.white),
//                         //       isOtherEducationTile: true,
//                         //       titleFirst: "12TH Standard",
//                         //       titleSecond: "2019-2020"),
//                         // ),
//                         // Container(
//                         //   color: AppColors.getColor(AppColorsEnum.primary),
//                         //   child: WidgetHelper.newDropDown(
//                         //       elevation: 0,
//                         //       iconVisible: false,
//                         //       dropDownBackgroundColor:
//                         //           AppColors.getColor(AppColorsEnum.primary),
//                         //       dropDownTileColor:
//                         //           AppColors.getColor(AppColorsEnum.primary),
//                         //       arrayList: standerd,
//                         //       onChange: (va) {
//                         //         setState(() {
//                         //           form2String41 = va;
//                         //         });
//                         //       },
//                         //       selectedvalue: form2String41,
//                         //       hintTextColor: Colors.white,
//                         //       textColor: Colors.white,
//                         //       hint: AppStrings.year),
//                         // ),

//                         // Row(
//                         //   children: [
//                         //     Expanded(
//                         //       child: WidgetHelper.simpleDropDown(
//                         //           iconVisible: false,
//                         //           dropDownBackgroundColor:
//                         //               AppColors.getColor(AppColorsEnum.primary),
//                         //           dropDownTileColor:
//                         //               AppColors.getColor(AppColorsEnum.primary),
//                         //           arrayList: standerd,
//                         //           onChange: (va) {
//                         //             setState(() {
//                         //               form2String41 = va;
//                         //             });
//                         //           },
//                         //           selectedvalue: form2String41,
//                         //           hintTextColor: Colors.white,
//                         //           textColor: Colors.white,
//                         //           hint: AppStrings.year),
//                         //     ),
//                         //     Expanded(
//                         //       child: WidgetHelper.simpleDropDown(
//                         //           iconVisible: false,
//                         //           dropDownBackgroundColor:
//                         //               AppColors.getColor(AppColorsEnum.primary),
//                         //           dropDownTileColor:
//                         //               AppColors.getColor(AppColorsEnum.primary),
//                         //           arrayList: standerd,
//                         //           onChange: (va) {
//                         //             setState(() {
//                         //               form2String41 = va;
//                         //             });
//                         //           },
//                         //           selectedvalue: form2String41,
//                         //           hintTextColor: Colors.white,
//                         //           textColor: Colors.white,
//                         //           hint: AppStrings.year),
//                         //     ),
//                         //   ],
//                         // ),
                      
                      
                      
//                         LayoutHelper.height15(),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 3),
//                           child: CustomText(
//                             textKey: AppStrings.addMoreAttendanceClasses,
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: WidgetHelper.newDropDown(
//                                   dropDownTileColor: AppColors.getColor(
//                                       AppColorsEnum.cityAndCountryFeildColor),
//                                   arrayList: className,
//                                   onChange: (va) {
//                                     setState(() {
//                                       form2String1 = va;
//                                     });
//                                   },
//                                   selectedvalue: form2String1,
//                                   hint: AppStrings.class_),
//                             ),
//                             LayoutHelper.width5(),
//                             Expanded(
//                               child: WidgetHelper.newDropDown(
//                                   dropDownTileColor: AppColors.getColor(
//                                       AppColorsEnum.cityAndCountryFeildColor),
//                                   arrayList: year,
//                                   onChange: (va) {
//                                     setState(() {
//                                       form2String2 = va;
//                                     });
//                                   },
//                                   selectedvalue: form2String2,
//                                   hint: AppStrings.year),
//                             ),
//                           ],
//                         ),

//                         // Row(
//                         //   children: [
//                         //     Expanded(
//                         //       child: WidgetHelper.newDropDown(
//                         //           dropDownTileColor: AppColors.getColor(
//                         //               AppColorsEnum.cityAndCountryFeildColor),
//                         //           arrayList: className,
//                         //           onChange: (va) {
//                         //             setState(() {
//                         //               form2String3 = va;
//                         //             });
//                         //           },
//                         //           selectedvalue: form2String3,
//                         //           hint: AppStrings.class_),
//                         //     ),
//                         //     LayoutHelper.width5(),
//                         //     Expanded(
//                         //       child: WidgetHelper.newDropDown(
//                         //           dropDownTileColor: AppColors.getColor(
//                         //               AppColorsEnum.cityAndCountryFeildColor),
//                         //           arrayList: year,
//                         //           onChange: (va) {
//                         //             setState(() {
//                         //               form2String4 = va;
//                         //             });
//                         //           },
//                         //           selectedvalue: form2String4,
//                         //           hint: AppStrings.year),
//                         //     ),
//                         //   ],
//                         // ),

//                         LayoutHelper.height30(),

//                         // Padding(
//                         //   padding: const EdgeInsets.only(left: 5),
//                         //   child: SizedBox(
//                         //     width: width,
//                         //     child: Column(
//                         //       mainAxisAlignment: MainAxisAlignment.start,
//                         //       crossAxisAlignment: CrossAxisAlignment.start,
//                         //       mainAxisSize: MainAxisSize.min,
//                         //       children: [
//                         //         InkWell(
//                         //           onTap: () async {},
//                         //           child: Container(
//                         //             padding: const EdgeInsets.only(
//                         //                 left: 25, right: 25, bottom: 5, top: 5),
//                         //             decoration: BoxDecoration(
//                         //                 borderRadius: BorderRadius.circular(5),
//                         //                 color: AppColors.getColor(
//                         //                     AppColorsEnum.primary)),
//                         //             child: Padding(
//                         //               padding: const EdgeInsets.all(8.0),
//                         //               child: CustomText(
//                         //                 textKey: AppStrings.addMore,
//                         //                 style: TextStyle(
//                         //                     fontSize: 15,
//                         //                     fontWeight: FontWeight.w400,
//                         //                     color: AppColors.getColor(
//                         //                         AppColorsEnum.white)),
//                         //               ),
//                         //             ),
//                         //           ),
//                         //         ),
//                         //       ],
//                         //     ),
//                         //   ),
//                         // ),

//                         LayoutHelper.height40(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: SizedBox(
//                             width: width,
//                             child: InkWell(
//                               onTap: () async {
//                                 Navigator.pop(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.only(
//                                     left: 25, right: 25, bottom: 5, top: 5),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: AppColors.getColor(
//                                         AppColorsEnum.secondaryColor)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Center(
//                                     child: CustomText(
//                                       textKey: AppStrings.addEducation,
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400,
//                                           color: AppColors.getColor(
//                                               AppColorsEnum.white)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             );
//           });
//         });
//       });
// }

// List<String> standerd = [
//   "12TH Standard",
//   "11th standard",
// ];

// addEducationSheet({
//   required BuildContext context,
//   required List<TextEditingController> secondFormcontrollers,
//   required String? form2String5,
//   required String? form2String6,
// }) {
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: AppColors.getColor(AppColorsEnum.white),
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.75,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         LayoutHelper.height10(),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 6,
//                               width: width * 0.45,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: AppColors.getColor(
//                                       AppColorsEnum.primary)),
//                             )
//                           ],
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             LayoutHelper.height30(),
//                             CustomText(
//                               textKey: AppStrings.addEducation,
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.getColor(
//                                       AppColorsEnum.secondaryColor)),
//                             ),
//                           ],
//                         ),
//                         WidgetHelper.inputHeadingTile(
//                             title: AppStrings.yourSchoolUnviversity),
//                         // WidgetHelper.getNameAndInputField("s", controller, context)
//                         for (int i = 0; i < 1; i++)
//                           ...WidgetHelper.getNameAndInputField(
//                             allBorderdisable: true,
//                             AppStrings.addEducation_,
//                             secondFormcontrollers[0],
//                             context,
//                             fillColor: AppColors.getColor(AppColorsEnum.white),
//                             enabledBorderWidth: 0,
//                             isShowIcon: true,
//                             verticalContentPadding: 13,
//                           ),

//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   WidgetHelper.inputHeadingTile(
//                                       title: AppStrings.selectCountry),
//                                   for (int i = 0; i < 1; i++)
//                                     ...WidgetHelper.getNameAndInputField(
//                                       allBorderdisable: true,
//                                       AppStrings.selectCountry,
//                                       secondFormcontrollers[1],
//                                       context,
//                                       fillColor: AppColors.getColor(
//                                           AppColorsEnum.white),
//                                       enabledBorderWidth: 0,
//                                       isShowIcon: true,
//                                       verticalContentPadding: 13,
//                                     ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   WidgetHelper.inputHeadingTile(
//                                       title: AppStrings.selectstate),
//                                   for (int i = 0; i < 1; i++)
//                                     ...WidgetHelper.getNameAndInputField(
//                                       allBorderdisable: true,
//                                       AppStrings.selectstate,
//                                       secondFormcontrollers[2],
//                                       context,
//                                       fillColor: AppColors.getColor(
//                                           AppColorsEnum.white),
//                                       enabledBorderWidth: 0,
//                                       isShowIcon: true,
//                                       verticalContentPadding: 13,
//                                     ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         WidgetHelper.inputHeadingTile(title: AppStrings.degree),
//                         WidgetHelper.newDropDown(
//                             arrayList: degree,
//                             onChange: (va) {
//                               setState(() {
//                                 form2String5 = va;
//                               });
//                             },
//                             selectedvalue: form2String5,
//                             hint: AppStrings.country),
//                         WidgetHelper.inputHeadingTile(
//                             title: AppStrings.batchYear),
//                         WidgetHelper.newDropDown(
//                             arrayList: year,
//                             onChange: (va) {
//                               setState(() {
//                                 form2String6 = va;
//                               });
//                             },
//                             selectedvalue: form2String6,
//                             hint: AppStrings.year),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 10, right: 10, bottom: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         LayoutHelper.height30(),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 5),
//                           child: SizedBox(
//                             width: width,
//                             child: InkWell(
//                               onTap: () async {
//                                 Navigator.pop(context);
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.only(
//                                     left: 25, right: 25, bottom: 5, top: 5),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: AppColors.getColor(
//                                         AppColorsEnum.secondaryColor)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Center(
//                                     child: Text(
//                                       "+ Add Education",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w400,
//                                           color: AppColors.getColor(
//                                               AppColorsEnum.white)),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//       });
// }
