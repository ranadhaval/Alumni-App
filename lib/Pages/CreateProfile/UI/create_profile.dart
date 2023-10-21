import 'package:alumni/Blocs/CreateProfileBloc/CreateProfileEvent/create_profile_event.dart';
import 'package:alumni/Blocs/CreateProfileBloc/CreateProfileState/create_profile_state.dart';
import 'package:alumni/Blocs/CreateProfileBloc/create_profile_bloc.dart';
import 'package:alumni/Constants/arrays.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/CreateProfile/Model/Request/form_request.dart';
import 'package:alumni/Pages/CreateProfile/Model/add_education_model.dart';
import 'package:alumni/Pages/CreateProfile/Model/drop_down_model.dart';
import 'package:alumni/Pages/CreateProfile/Model/experience_model.dart';
import 'package:alumni/Pages/CreateProfile/UI/FormAssets.dart';
import 'package:alumni/Pages/CreateProfile/drop_down_widget.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/signin_response.dart';
import 'package:alumni/Pages/Welcome/welcomeScreen2.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CreateProfile extends StatefulWidget {
  static String routeName = '/createprofile';
  SigninRes signinRes = SigninRes();
  CreateProfile({super.key, required this.signinRes});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  // form body 1 form key
  final formKey1 = GlobalKey<FormState>();

  // form body 1 form key
  final formKey3 = GlobalKey<FormState>();

  // progressRate
  double progressRate = 0.33;

  // message or call check index
  int checkIndex = 0;

  //Yes no button Index
  int yes = 1;
  int index = 0;

  // fisrtForm Fields
  List<TextEditingController> firstFormcontrollers = getTextController(4);

  // secondForm Feilds
  List<TextEditingController> secondFormcontrollers = getTextController(1);

  // thirdForm Feilds
  List<TextEditingController> thirdFormcontrollers = getTextController(4);

  String? valueString;
  String? valueString2;
  String? valueString3;

  String? form2String51;
  String? form2String52;

  String? form2String5;
  String? form2String6;

  String? form3String1;
  String? form3String2;
  String? form3String3;
  String? form3String4;

  List<String> standerd = [
    "12TH Standard",
    "11TH Standard",
    "10TH Standard",
    "9TH Standard",
    "8TH Standard",
  ];

  List<String> passYear = [
    "2023-2022",
    "2022-2021",
    "2021-2020",
    "2020-2021",
    "2021-2019",
    "2019-2018",
  ];

  List<DropDownModel> dropDownList = [];
  List<AddEducationModel> addEducationList = [];
  List<ExperienceModel> expirienceList = [];

  final formKeyForeducation = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProfileBloc, CreateProfileState>(
      listener: (context, state) {
        if (state is CreateProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            WidgetHelper.getSnackBar(
                context, state.Error.toString(), Colors.red),
          );
        }
      },
      builder: (context, state) {
        CreateProfileBloc createProfileBloc =
            BlocProvider.of<CreateProfileBloc>(context);
        return LayoutHelper.pageContainer(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            appBar: appBar(
              color: AppColors.getColor(AppColorsEnum.formAppBarColor),
            ),
            backgroundColor: AppColors.getColor(AppColorsEnum.formBodyColor),
            child: Column(
              children: [
                formHeader(progressRate: progressRate),
                Builder(builder: (context) {
                  switch (index) {
                    case 0:
                      return formBody1(createProfileBloc: createProfileBloc);
                    case 1:
                      return formBody2(createProfileBloc: createProfileBloc);
                    case 2:
                      return formBody3();
                    case 3:
                      return experiancePage(
                          createProfileBloc: createProfileBloc,
                          createProfileState: state);
                    default:
                      return formBody1(createProfileBloc: createProfileBloc);
                  }
                })
              ],
            ));
      },
    );
  }

  formBody1({required CreateProfileBloc createProfileBloc}) {
    return Form(
      key: formKey1,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 12),
            child: Column(
              children: [
                WidgetHelper.inputHeadingTile(
                    title: AppStrings.addYourCurrentLocation),

                // country Dropdown

                WidgetHelper.newDropDown(
                    errorMessage: "Choose Country",
                    arrayList: country,
                    onChange: (value) {
                      setState(() {
                        valueString2 = value;
                      });
                    },
                    selectedvalue: valueString2,
                    hint: AppStrings.country),

                // House No. textfield

                for (int i = 0; i < 1; i++)
                  ...WidgetHelper.getNameAndInputField(
                    allBorderdisable: true,
                    AppStrings.houseNo,
                    firstFormcontrollers[0],
                    context,
                    fillColor: AppColors.getColor(AppColorsEnum.white),
                    enabledBorderWidth: 0,
                    isShowIcon: true,
                    verticalContentPadding: 13,
                  ),

                // State and city . Dropdown

                Row(
                  children: [
                    Expanded(
                      child: WidgetHelper.newDropDown(
                          errorMessage: "Choose State",
                          arrayList: state,
                          onChange: (value) {
                            setState(() {
                              valueString = value;
                            });
                          },
                          selectedvalue: valueString,
                          hint: AppStrings.state),
                    ),
                    LayoutHelper.width10(),
                    Expanded(
                      child: WidgetHelper.newDropDown(
                          errorMessage: "Choose City",
                          arrayList: city,
                          onChange: (value) {
                            setState(() {
                              valueString3 = value;
                            });
                          },
                          selectedvalue: valueString3,
                          hint: AppStrings.city),
                    ),
                  ],
                ),

                WidgetHelper.inputHeadingTile(title: AppStrings.contactNumber),

                // Mobile Number Textfeild

                for (int i = 0; i < 1; i++)
                  ...WidgetHelper.getNameAndInputField(
                      allBorderdisable: true,
                      AppStrings.mobileNumber,
                      firstFormcontrollers[1],
                      context,
                      fillColor: AppColors.getColor(AppColorsEnum.white),
                      enabledBorderWidth: 0,
                      isShowIcon: true,
                      isMob: true,
                      verticalContentPadding: 13,
                      suffixicon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              textKey: AppStrings.change,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor),
                            )
                          ],
                        ),
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CustomText(textKey: AppStrings.text_91)],
                      )),

                WidgetHelper.inputHeadingTile(title: AppStrings.dateOfBirth),

                // Date of Birth Textfeild

                SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.35,
                        child: Column(
                          children: [
                            for (int i = 0; i < 1; i++)
                              ...WidgetHelper.getNameAndInputField(
                                allBorderdisable: true,
                                onTap: () async {
                                  DateTime? datePicked = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime(2006, DateTime.january, 01),
                                      firstDate: DateTime(
                                          1940,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      lastDate: DateTime(
                                          2006, DateTime.december, 31));
                                  setState(() {
                                    firstFormcontrollers[2].text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(datePicked!);
                                  });
                                },
                                readOnly: true,
                                AppStrings.birthFormate,
                                firstFormcontrollers[2],
                                context,
                                fillColor:
                                    AppColors.getColor(AppColorsEnum.white),
                                enabledBorderWidth: 0,
                                isShowIcon: true,
                                verticalContentPadding: 13,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                WidgetHelper.inputHeadingTile(title: AppStrings.bio),

                // My Bio Textfeild

                Column(
                  children: [
                    for (int i = 0; i < 1; i++)
                      ...WidgetHelper.getNameAndInputField(
                        allBorderdisable: true,
                        AppStrings.bioFormate,
                        maxlines: 3,
                        firstFormcontrollers[3],
                        context,
                        fillColor: AppColors.getColor(AppColorsEnum.white),
                        enabledBorderWidth: 0,
                        isShowIcon: true,
                        verticalContentPadding: 13,
                      ),
                  ],
                ),

                // Best Way Reach Way  ( message or call ) checkBox

                WidgetHelper.inputHeadingTile(
                    title: AppStrings.bestWayToReachYou),
                LayoutHelper.height10(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkIndex = 1;
                              });
                            },
                            child: Card(
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: checkIndex == 1
                                    ? AppColors.getColor(AppColorsEnum.primary)
                                    : AppColors.getColor(AppColorsEnum.white),
                              ),
                            ),
                          ),
                          LayoutHelper.width5(),
                          CustomText(textKey: AppStrings.message)
                        ],
                      ),
                      LayoutHelper.width20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkIndex = 2;
                              });
                            },
                            child: Card(
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: checkIndex == 2
                                    ? AppColors.getColor(AppColorsEnum.primary)
                                    : AppColors.getColor(AppColorsEnum.white),
                              ),
                            ),
                          ),
                          LayoutHelper.width5(),
                          CustomText(textKey: AppStrings.call)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: width * 0.45,
                        child: CustomButtonElevated(
                            buttonColor:
                                AppColors.getColor(AppColorsEnum.primary),
                            type: ButtonType.primary,
                            text: AppStrings.next,
                            onTap: () async {
                              if (formKey1.currentState!.validate() &&
                                  progressRate >= 0.66 == false) {
                                print("object");

                                setState(() {
                                  index = 1;
                                  progressRate += 0.33;

                                  createProfileBloc.personalDetailsRequest =
                                      PersonalDetailsRequest(
                                          address: AddressRequest(
                                              city: valueString3,
                                              country: valueString2,
                                              street:
                                                  firstFormcontrollers[0].text,
                                              state: valueString),
                                          dob: firstFormcontrollers[2].text,
                                          bio: firstFormcontrollers[3].text,
                                          contactWay: checkIndex == 1
                                              ? "Message"
                                              : checkIndex == 2
                                                  ? "Call"
                                                  : "");
                                });
                                print(createProfileBloc
                                    .personalDetailsRequest.bio);
                                // createProfileBloc.personalDetailsRequest =
                                //     PersonalDetailsRequest(
                                //         address: AddressRequest(
                                //             city: valueString3,
                                //             country: valueString2,
                                //             street:
                                //                 firstFormcontrollers[0].text,
                                //             state: valueString),
                                //         dob: firstFormcontrollers[2].text,
                                //         bio: firstFormcontrollers[3].text,
                                //         contactWay: checkIndex == 1
                                //             ? "Message"
                                //             : checkIndex == 2
                                //                 ? "Call"
                                //                 : "");
                              } else if ((valueString == null ||
                                  valueString2 == null ||
                                  valueString3 == null ||
                                  firstFormcontrollers[0].text.isEmpty ||
                                  firstFormcontrollers[1].text.isEmpty ||
                                  firstFormcontrollers[2].text.isEmpty ||
                                  firstFormcontrollers[3].text.isEmpty ||
                                  checkIndex == 0)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  WidgetHelper.getSnackBar(
                                      context,
                                      AppStrings.pleaseCheckAllFeilds,
                                      AppColors.getColor(AppColorsEnum.red)),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  formBody2({required CreateProfileBloc createProfileBloc}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: height * 0.86,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Container(
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
                              CustomText(
                                textKey: AppStrings.cirsEducation,
                                size: 11,
                                color: AppColors.getColor(AppColorsEnum.white),
                              )
                            ],
                          ),
                        ),
                        LayoutHelper.height5(),
                        Column(
                          children: [
                            for (int i = 0; i < dropDownList.length; i++) ...[
                              standerdTile(
                                  titleFirst:
                                      "${dropDownList[i].class_}TH Standerd",
                                  titleSecond: dropDownList[i].year,
                                  onTap: () {
                                    setState(() {
                                      dropDownList.removeAt(i);
                                      // widget.callback();
                                    });
                                  }),
                            ],
                            standerdTile(
                              titleFirst:
                                  "${widget.signinRes.data!.userDetails!.passingClass}TH Standerd",
                              titleSecond:
                                  "${widget.signinRes.data!.userDetails!.passingYear}",
                              isOtherEducationTile: true,
                            ),
                          ],
                        ),
                        LayoutHelper.height15(),
                        InkWell(
                          onTap: () {
                            addCIRSBottomSheet(
                                context: context,
                                createProfileBloc: createProfileBloc);
                          },
                          child: CustomText(
                            textKey: "+ Add CIRS Education",
                            size: 16,
                            bold: true,
                            color: AppColors.getColor(
                              AppColorsEnum.secondaryColor,
                            ),
                          ),
                        ),
                      ]),
                ),
                LayoutHelper.height20(),
                for (int i = 0; i < addEducationList.length; i++) ...[
                  degreeDetail(i, () {
                    addEducationList.removeAt(i);
                    setState(() {});
                  }),
                ],
                LayoutHelper.height15(),
                SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () async {
                          addEducationSheet(onTap: () {
                            if (formKeyForeducation.currentState!.validate()) {
                              addeducationList(
                                  Year: form2String5!,
                                  Country: form2String51!,
                                  state: form2String52!,
                                  CollageName: secondFormcontrollers[0].text,
                                  Degree: form2String6!);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              textKey: "+ Add Other Education",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      AppColors.getColor(AppColorsEnum.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width * 0.45,
                    child: CustomButtonElevated(
                        buttonColor: AppColors.getColor(AppColorsEnum.primary),
                        type: ButtonType.primary,
                        text: AppStrings.next,
                        onTap: () async {
                          if (progressRate == 0.66) {
                            setState(() {
                              index = 2;
                              progressRate += 0.34;
                            });
                            getDataForEducation(
                                createProfileBloc: createProfileBloc);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  formBody3() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Form(
        key: formKey3,
        child: Column(
          children: [
            WidgetHelper.inputHeadingTile(
                title: AppStrings.doYouHaveExperience),
            LayoutHelper.height10(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: width / 2,
                      child: Row(
                        children: [
                          yesNoButton(
                              index: 1,
                              title: AppStrings.yes,
                              onTap: () {
                                setState(() {
                                  yes = 1;
                                });
                              },
                              yes: yes),
                          LayoutHelper.width30(),
                          yesNoButton(
                              index: 2,
                              title: AppStrings.no,
                              onTap: () {
                                setState(() {
                                  yes = 2;
                                });
                              },
                              yes: yes),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Column(
                  children: [
                    WidgetHelper.inputHeadingTile(
                        title: AppStrings.yourCurrentJob),
                    for (int i = 0; i < 1; i++)
                      ...WidgetHelper.getNameAndInputField(
                        allBorderdisable: true,
                        AppStrings.yourCurrentJob,
                        thirdFormcontrollers[0],
                        context,
                        fillColor: AppColors.getColor(AppColorsEnum.white),
                        enabledBorderWidth: 0,
                        isShowIcon: true,
                        verticalContentPadding: 13,
                      ),
                    WidgetHelper.inputHeadingTile(title: AppStrings.company),
                    WidgetHelper.newDropDown(
                        errorMessage: "Choose Company",
                        arrayList: company,
                        onChange: (va) {
                          setState(() {
                            form3String1 = va;
                          });
                        },
                        selectedvalue: form3String1,
                        hint: AppStrings.company),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              WidgetHelper.inputHeadingTile(
                                  title: AppStrings.companyCountry),
                              WidgetHelper.newDropDown(
                                  errorMessage: "Choose Country",
                                  arrayList: country,
                                  onChange: (va) {
                                    setState(() {
                                      form3String2 = va;
                                    });
                                  },
                                  selectedvalue: form3String2,
                                  hint: AppStrings.country),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              WidgetHelper.inputHeadingTile(
                                  title: AppStrings.companyState),
                              WidgetHelper.newDropDown(
                                  errorMessage: "Choose State",
                                  arrayList: state,
                                  onChange: (va) {
                                    setState(() {
                                      form3String3 = va;
                                    });
                                  },
                                  selectedvalue: form3String3,
                                  hint: AppStrings.state),
                            ],
                          ),
                        )
                      ],
                    ),
                    WidgetHelper.inputHeadingTile(
                        title: AppStrings.employeeType),
                    WidgetHelper.newDropDown(
                        errorMessage: "Choose Employement Type",
                        arrayList: employmentType,
                        onChange: (va) {
                          setState(() {
                            form3String4 = va;
                          });
                        },
                        selectedvalue: form3String4,
                        hint: AppStrings.enterEmployeeType),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              WidgetHelper.inputHeadingTile(
                                  title: AppStrings.startDate),
                              for (int i = 0; i < 1; i++)
                                ...WidgetHelper.getNameAndInputField(
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? datePicked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            2023, DateTime.january, 01),
                                        firstDate: DateTime(
                                            2000,
                                            DateTime.now().month,
                                            DateTime.now().day),
                                        lastDate: DateTime.now());

                                    //      context: context,
                                    // initialDate:
                                    //     DateTime(2006, DateTime.january, 01),
                                    // firstDate: DateTime(
                                    //     1940,
                                    //     DateTime.now().month,
                                    //     DateTime.now().day),
                                    // lastDate: DateTime(
                                    //     2006, DateTime.december, 31)

                                    setState(() {
                                      thirdFormcontrollers[1].text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(datePicked!);
                                    });
                                  },
                                  allBorderdisable: true,
                                  AppStrings.selectDate,
                                  thirdFormcontrollers[1],
                                  context,
                                  fillColor:
                                      AppColors.getColor(AppColorsEnum.white),
                                  enabledBorderWidth: 0,
                                  isShowIcon: true,
                                  verticalContentPadding: 13,
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              WidgetHelper.inputHeadingTile(
                                title: AppStrings.endDate,
                              ),
                              for (int i = 0; i < 1; i++)
                                ...WidgetHelper.getNameAndInputField(
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? datePicked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(
                                            2023, DateTime.january, 01),
                                        firstDate: DateTime(
                                            2000,
                                            DateTime.now().month,
                                            DateTime.now().day),
                                        lastDate: DateTime.now());
                                    setState(() {
                                      thirdFormcontrollers[2].text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(datePicked!);
                                    });
                                  },
                                  allBorderdisable: true,
                                  AppStrings.selectDate,
                                  thirdFormcontrollers[2],
                                  context,
                                  fillColor:
                                      AppColors.getColor(AppColorsEnum.white),
                                  enabledBorderWidth: 0,
                                  isShowIcon: true,
                                  verticalContentPadding: 13,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Welcome2()));
                        },
                        child: CustomText(
                          textKey: AppStrings.skip,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor)),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.45,
                        child: CustomButtonElevated(
                            buttonColor:
                                AppColors.getColor(AppColorsEnum.primary),
                            type: ButtonType.primary,
                            text: AppStrings.next,
                            onTap: () async {
                              if (yes == 2) {
                                setState(() {
                                  index = 3;
                                });
                              } else if (!formKey3.currentState!.validate() ||
                                  thirdFormcontrollers[0].text.isEmpty ||
                                  thirdFormcontrollers[1].text.isEmpty ||
                                  thirdFormcontrollers[2].text.isEmpty ||
                                  form3String1 == null ||
                                  form3String2 == null ||
                                  form3String3 == null ||
                                  form3String4 == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  WidgetHelper.getSnackBar(
                                      context,
                                      AppStrings.pleaseCheckAllFeilds,
                                      AppColors.getColor(AppColorsEnum.red)),
                                );
                              } else {
                                await addExperience();
                              }
                            }),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  experiancePage(
      {required CreateProfileBloc createProfileBloc,
      required CreateProfileState createProfileState}) {
    return SizedBox(
      height: height * 0.9,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                for (int i = 0; i < expirienceList.length; i++) ...[
                  experienceTile(
                      company: expirienceList[i].company,
                      companyCountry: expirienceList[i].companyCountry,
                      companyState: expirienceList[i].companyState,
                      currentJob: expirienceList[i].currentJob,
                      employeeType: expirienceList[i].employeeType,
                      employementEndDate: expirienceList[i].employementEndDate,
                      employementStartDate:
                          expirienceList[i].employementStartDate),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Text("+ Add Experience",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.getColor(
                              AppColorsEnum.secondaryColor,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Welcome2()));
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor)),
                        ),
                      ),
                      SizedBox(
                        width: (createProfileState is CreateProfileLoadingState)
                            ? width * 0.1
                            : width * 0.45,
                        child: (createProfileState is CreateProfileLoadingState)
                            ? CircularProgressIndicator()
                            : CustomButtonElevated(
                                buttonColor:
                                    AppColors.getColor(AppColorsEnum.primary),
                                type: ButtonType.primary,
                                text: AppStrings.done,
                                onTap: () {
                                  // getDataForExperience(
                                  //     createProfileBloc: createProfileBloc);
                                  // print(createProfileBloc
                                  //     .educationDetails.length);
                                  // print(createProfileBloc
                                  //     .professionalDetails.length);
                                  // print(createProfileBloc
                                  //     .personalDetailsRequest.address);

                                  createProfileBloc.add(
                                      CreateProfileSubmitEvent(
                                          context: context));
                                }),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // refresh function

  refresh() {
    setState(() {});
    Navigator.pop(context);
  }

  // add education

  addCIRSBottomSheet(
      {required BuildContext context,
      required CreateProfileBloc createProfileBloc}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        builder: (context) {
          return Builder(builder: (context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutHelper.height10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    AppColors.getColor(AppColorsEnum.primary)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutHelper.height30(),
                            CustomText(
                              textKey: "Add CIRS Classes",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.getColor(
                                      AppColorsEnum.secondaryColor)),
                            ),
                            LayoutHelper.height15(),
                            const Text(
                              AppStrings.yourPassingClass,
                              style: TextStyle(fontSize: 12),
                            ),
                            LayoutHelper.height5(),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10, top: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: AppColors.getColor(
                                      AppColorsEnum.primary)),
                              child: standerdTile(
                                  textcolor:
                                      AppColors.getColor(AppColorsEnum.white),
                                  isOtherEducationTile: true,
                                  titleFirst:
                                      "  ${widget.signinRes.data!.userDetails!.passingClass}TH Standerd",
                                  titleSecond: widget
                                      .signinRes.data!.userDetails!.passingYear
                                      .toString()),
                            ),

                            // Row(
                            //   children: [
                            //     Expanded(
                            //       flex: 4,
                            //       child: WidgetHelper.simpleDropDown(
                            //           iconVisible: false,
                            //           dropDownBackgroundColor: AppColors.getColor(
                            //               AppColorsEnum.primary),
                            //           dropDownTileColor: AppColors.getColor(
                            //               AppColorsEnum.primary),
                            //           arrayList: standerd,
                            //           onChange: (va) {
                            //             setState(() {
                            //               form2String41_ = va;
                            //             });
                            //           },
                            //           selectedvalue: form2String41_,
                            //           hintTextColor: Colors.white,
                            //           textColor: Colors.white,
                            //           hint: AppStrings.standerd),
                            //     ),
                            //     Expanded(
                            //       flex: 3,
                            //       child: WidgetHelper.simpleDropDown(
                            //           iconVisible: false,
                            //           dropDownBackgroundColor: AppColors.getColor(
                            //               AppColorsEnum.primary),
                            //           dropDownTileColor: AppColors.getColor(
                            //               AppColorsEnum.primary),
                            //           arrayList: passYear,
                            //           onChange: (va) {
                            //             setState(() {
                            //               form2String42_ = va;
                            //             });
                            //           },
                            //           selectedvalue: form2String42_,
                            //           hintTextColor: Colors.white,
                            //           textColor: Colors.white,
                            //           hint: AppStrings.passingYear),
                            //     )
                            //   ],
                            // ),

                            LayoutHelper.height15(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: CustomText(
                                textKey: AppStrings.addMoreAttendanceClasses,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            // Container(
                            //   height: height * 0.15,
                            //   child: ListView.builder(
                            //       key: UniqueKey(),
                            //       itemCount: dropDownList.length,
                            //       itemBuilder: (BuildContext ctxt, int index) {
                            //         return DropDownWidget(
                            //           dropDown: dropDownList,
                            //           index: index,
                            //         );
                            //       }),
                            // ),
                            for (int i = 0; i < dropDownList.length; i++) ...[
                              DropDownWidget(
                                dropDown: dropDownList,
                                index: i,
                              )
                            ]
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: WidgetHelper.newDropDown(
                            //           dropDownTileColor: AppColors.getColor(
                            //               AppColorsEnum.cityAndCountryFeildColor),
                            //           arrayList: className,
                            //           onChange: (va) {
                            //             setState(() {
                            //               form2String1_ = va;
                            //             });
                            //           },
                            //           selectedvalue: form2String1_,
                            //           hint: AppStrings.class_),
                            //     ),
                            //     LayoutHelper.width5(),
                            //     Expanded(
                            //       child: WidgetHelper.newDropDown(
                            //           dropDownTileColor: AppColors.getColor(
                            //               AppColorsEnum.cityAndCountryFeildColor),
                            //           arrayList: year,
                            //           onChange: (va) {
                            //             setState(() {
                            //               form2String2_ = va;
                            //             });
                            //           },
                            //           selectedvalue: form2String2_,
                            //           hint: AppStrings.year),
                            //     ),
                            //   ],
                            // ),

                            ,
                            LayoutHelper.height5(),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        dropDownList.add(DropDownModel(
                                          class_: className[0],
                                          year: year[0],
                                        ));
                                        print("object");

                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            bottom: 5,
                                            top: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.getColor(
                                                AppColorsEnum.primary)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomText(
                                            textKey: AppStrings.addMore,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.getColor(
                                                    AppColorsEnum.white)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            LayoutHelper.height40(),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: width,
                                child: InkWell(
                                  onTap: () => refresh(),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25, bottom: 5, top: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.getColor(
                                            AppColorsEnum.secondaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CustomText(
                                          textKey: AppStrings.addEducation,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.getColor(
                                                  AppColorsEnum.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            LayoutHelper.height10(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          });
        });
  }

  addeducationList(
      {required String Year,
      required String Country,
      required String state,
      required String CollageName,
      required String Degree}) {
    addEducationList.add(AddEducationModel(
        batchYear: Year,
        country_: Country,
        state: state,
        universityName: CollageName,
        degree: Degree));
    setState(() {});

    Navigator.pop(context);

    secondFormcontrollers[0].text = "";
    form2String5 = null;
    form2String51 = null;
    form2String52 = null;

    form2String6 = null;
  }

  addEducationSheet(
      {
      //   required BuildContext context,
      // required List<TextEditingController> secondFormcontrollers,
      // required String? form2String5,
      // required String? form2String6,
      void Function()? onTap}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.getColor(AppColorsEnum.white),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
              key: formKeyForeducation,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutHelper.height10(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 6,
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.getColor(
                                          AppColorsEnum.primary)),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LayoutHelper.height30(),
                                CustomText(
                                  textKey: AppStrings.addEducation,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.getColor(
                                          AppColorsEnum.secondaryColor)),
                                ),
                              ],
                            ),
                            WidgetHelper.inputHeadingTile(
                                title: AppStrings.yourSchoolUnviversity),
                            // WidgetHelper.getNameAndInputField("s", controller, context)
                            for (int i = 0; i < 1; i++)
                              ...WidgetHelper.getNameAndInputField(
                                allBorderdisable: true,
                                AppStrings.addEducation_,
                                secondFormcontrollers[0],
                                context,
                                fillColor:
                                    AppColors.getColor(AppColorsEnum.white),
                                enabledBorderWidth: 0,
                                isShowIcon: true,
                                verticalContentPadding: 13,
                              ),

                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      WidgetHelper.inputHeadingTile(
                                          title: AppStrings.selectCountry),
                                      WidgetHelper.newDropDown(
                                          errorMessage: "Choose Country",
                                          arrayList: country,
                                          onChange: (value) {
                                            setState(() {
                                              form2String51 = value;
                                            });
                                          },
                                          selectedvalue: form2String51,
                                          hint: AppStrings.country),
                                    ],
                                  ),
                                ),
                                LayoutHelper.width10(),
                                Expanded(
                                  child: Column(
                                    children: [
                                      WidgetHelper.inputHeadingTile(
                                          title: AppStrings.selectstate),
                                      WidgetHelper.newDropDown(
                                          errorMessage: "Choose State",
                                          arrayList: state,
                                          onChange: (value) {
                                            setState(() {
                                              form2String52 = value;
                                            });
                                          },
                                          selectedvalue: form2String52,
                                          hint: AppStrings.state),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            WidgetHelper.inputHeadingTile(
                                title: AppStrings.degree),
                            WidgetHelper.newDropDown(
                                errorMessage: "Choose degree",
                                arrayList: degree,
                                onChange: (va) {
                                  setState(() {
                                    form2String5 = va;
                                  });
                                },
                                selectedvalue: form2String5,
                                hint: AppStrings.degree),
                            WidgetHelper.inputHeadingTile(
                                title: AppStrings.batchYear),
                            WidgetHelper.newDropDown(
                                errorMessage: "Choose year",
                                arrayList: year,
                                onChange: (va) {
                                  setState(() {
                                    form2String6 = va;
                                  });
                                },
                                selectedvalue: form2String6,
                                hint: AppStrings.year),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutHelper.height30(),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                width: width,
                                child: InkWell(
                                  onTap: onTap,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25, bottom: 5, top: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.getColor(
                                            AppColorsEnum.secondaryColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          "+ Add Education",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.getColor(
                                                  AppColorsEnum.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  getDataForEducation({required CreateProfileBloc createProfileBloc}) async {
    for (int i = 0; i < dropDownList.length; i++) {
      try {
        createProfileBloc.educationDetails.add(EducationDetailsRequest(
            school: "CIRS",
            standard: int.parse(dropDownList[i].class_),
            existingSchool: true,
            passingYear: dropDownList[i].year));
      } catch (e) {
        print(e);
      }
    }

    for (int i = 0; i < addEducationList.length; i++) {
      try {
        createProfileBloc.educationDetails.add(EducationDetailsRequest(
            school: addEducationList[i].universityName,
            degree: addEducationList[i].degree,
            state: addEducationList[i].state,
            country: addEducationList[i].country_,
            passingYear: addEducationList[i].batchYear));
      } catch (e) {
        print(e);
      }
    }

    print(createProfileBloc.educationDetails.length);
  }

  degreeDetail(int index, void Function()? onTap) {
    return SizedBox(
      width: width,
      height: height * 0.12,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width * 0.9,
              height: height * 0.1,
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10, top: 5),
              decoration: BoxDecoration(
                  color: AppColors.getColor(AppColorsEnum.white),
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0.4, 0.4),
                        color: AppColors.getColor(AppColorsEnum.white))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.getColor(AppColorsEnum.secondaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LayoutHelper.width5(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CustomText(
                            textKey:
                                "${addEducationList[index].universityName},${addEducationList[index].state},${addEducationList[index].country_}",
                            size: 11,
                            color: AppColors.getColor(AppColorsEnum.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  LayoutHelper.height10(),
                  standerdTile(
                      isOtherEducationTile: true,
                      titleFirst: addEducationList[index].batchYear,
                      titleSecond: addEducationList[index].degree,
                      textColor: AppColors.getColor(AppColorsEnum.black)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.getColor(AppColorsEnum.red),
                    child: SvgPicture.asset(
                      ImageConstant.cancel,
                      color: AppColors.getColor(AppColorsEnum.white),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  // add experience

  experienceTile(
      {required String company,
      required String companyCountry,
      required String companyState,
      required String currentJob,
      required String employeeType,
      required String employementEndDate,
      required String employementStartDate}) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
          width: width,
          decoration: BoxDecoration(
              color: AppColors.getColor(AppColorsEnum.primary),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: SizedBox(
                            height: height * 0.087,
                            width: width * 0.3,
                            child: SvgPicture.asset(
                              ImageConstant.google,
                            ),
                          ),
                        ),
                        LayoutHelper.height5(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LayoutHelper.width5(),
                                Text(
                                  company,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        AppColors.getColor(AppColorsEnum.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    LayoutHelper.width10(),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.34,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentJob,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            LayoutHelper.width10(),
                            SizedBox(
                              width: width * 0.21,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employementStartDate.toString(),
                                    style: const TextStyle(color: Colors.white),
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
                              width: width * 0.35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$companyCountry,$companyState",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            LayoutHelper.width10(),
                            SizedBox(
                              width: width * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employeeType,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ]),
        ),
        LayoutHelper.height20(),
      ],
    );
  }

  getDataForExperience({required CreateProfileBloc createProfileBloc}) async {
    for (int i = 0; i < expirienceList.length; i++) {
      try {
        createProfileBloc.professionalDetails.add(ProfessionalDetailsRequest(
          // school: "CIRS",
          // standard: int.parse(dropDownList[i].class_),
          // existingSchool: true,
          // passingYear: dropDownList[i].year
          company: expirienceList[i].company,
          designation: expirienceList[i].currentJob,
          country: expirienceList[i].companyCountry,
          state: expirienceList[i].companyState,
          employmentType: expirienceList[i].employeeType,
          startDate: expirienceList[i].employementStartDate,
          endDate: expirienceList[i].employementEndDate,
        ));
        print(createProfileBloc.professionalDetails.length);
      } catch (e) {
        print(e);
      }
    }

    print(createProfileBloc.educationDetails.length);
  }

  addExperience() {
    expirienceList.add(ExperienceModel(
        company: form3String1!,
        companyCountry: form3String2!,
        companyState: form3String3!,
        currentJob: thirdFormcontrollers[0].text,
        employeeType: form3String4!,
        employementEndDate: thirdFormcontrollers[1].text,
        employementStartDate: thirdFormcontrollers[2].text));
    setState(() {
      index = 3;
    });

    setState(() {});

    thirdFormcontrollers[0].text = "";

    thirdFormcontrollers[1].text = "";
    thirdFormcontrollers[2].text = "";
    form3String1 = null;
    form3String2 = null;
    form3String3 = null;
    form3String4 = null;
  }
}
