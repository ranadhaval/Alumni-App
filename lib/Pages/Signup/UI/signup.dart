import 'package:alumni/Blocs/SignUpBloc/signup_bloc.dart';
import 'package:alumni/Blocs/SignUpBloc/signup_event/signup_event.dart';
import 'package:alumni/Blocs/SignUpBloc/signup_state/signup_state.dart';
import 'package:alumni/Constants/arrays.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/get_school_branches.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/app_typography.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Functions/common.dart';

class Signup extends StatefulWidget {
  static String routeName = '/signup';

  const Signup({Key? key}) : super(key: key);
  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = getTextController(8);
  bool check = false;

  // textfield nameList
  List<String> names = [
    AppStrings.yourEmail,
    AppStrings.selectYourSchoolBranch,
    AppStrings.yourPassingYear,
    AppStrings.yourPassingClass,
    AppStrings.classRollNumber,
    AppStrings.createpassword
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        appBar:
            appBar(color: AppColors.getColor(AppColorsEnum.primaryColorAppbar)),
        backgroundColor: AppColors.getColor(AppColorsEnum.primary),
        horizontalPadding: 15,
        child: BlocConsumer<SignUpBloc, SignUpMainState>(
          listener: (context, state) {
            if (state is SignUpErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                WidgetHelper.getSnackBar(context, state.Error, Colors.red),
              );
            }
          },
          builder: (context, state) {
            return body(context, state);
          },
        ));
  }

  body(context, state) {
    final SignUpBloc signUpBloc = BlocProvider.of<SignUpBloc>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          LayoutHelper.height10(),
          //Logo
          Image.asset(
            ImageConstant.alumniLogo,
            height: height * 0.09,
          ),
          //Title
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () =>
                        navigateToPageReplaceMentNamed(SignIn.routeName),
                    child: CustomText(
                        textKey: AppStrings.login,
                        style: AppTextStyle.titleLarge,
                        textAlign: TextAlign.center,
                        color: AppColors.getSingleColor(AppColorsEnum.white)),
                  ),
                  Text(
                    AppStrings.devider,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.getSingleColor(AppColorsEnum.white)),
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                  ),
                  LayoutHelper.width10(),
                  CustomText(
                    textKey: AppStrings.register,
                    style: AppTextStyle.titleLarge,
                    textAlign: TextAlign.center,
                    color:
                        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width * 0.85,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    textKey: AppStrings.enterDetailsOfRegistrtion,
                    style: AppTextStyle.bodyLarge.copyWith(fontSize: 18),
                    textAlign: TextAlign.left,
                    color: AppColors.getSingleColor(AppColorsEnum.white),
                  ),
                ),
                LayoutHelper.height10(),
                Row(
                  children: [
                    Expanded(
                      child: firstLastNameFeilds(
                          controller: controllers[6],
                          hintText: AppStrings.firstName,
                          readOnly: (state is SignUpLoadingState)),
                    ),
                    Expanded(
                      child: firstLastNameFeilds(
                          controller: controllers[7],
                          hintText: AppStrings.lastName,
                          readOnly: (state is SignUpLoadingState)),
                    )
                  ],
                ),
                LayoutHelper.height5(),
                for (int i = 0; i < 6; i++) //5
                  ...WidgetHelper.getNameAndInputField(
                    names[i],
                    controllers[i],
                    context,
                    readOnly: i == 1 ||
                        i == 2 ||
                        i == 3 ||
                        (state is SignUpLoadingState),
                    isEmail: i == 0,
                    isPass: i == 5,
                    isShowIcon: true,
                    isNum: i == 4,
                    fillColor: AppColors.getColor(AppColorsEnum.white),
                    suffixicon: suffixIcon(
                        context, i, state, signUpBloc.schoolBranches)[i],
                    prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        width: 1,
                        child: Image.asset(
                          prefixIcon[i],
                          width: 1,
                        )),
                  ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              setState(() {
                check = !check;
              });
            },
            child: Row(
              children: [
                SizedBox(
                  height: 5,
                  child: Checkbox(
                    checkColor:
                        AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = !check;
                      });
                    },
                    fillColor: MaterialStateProperty.all(
                        AppColors.getColor(AppColorsEnum.white)),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: AppStrings.acceptTerms,
                          style: AppTextStyle.bodyMedium.copyWith(
                              color: AppColors.getColor(AppColorsEnum.white))),
                      TextSpan(
                        text: AppStrings.terms,
                        style: AppTextStyle.titleSmall.copyWith(
                            color: AppColors.getColor(
                                AppColorsEnum.secondaryColor)),
                      ),
                      TextSpan(
                        text: AppStrings.and,
                        style: AppTextStyle.bodyMedium.copyWith(
                            color: AppColors.getColor(AppColorsEnum.white)),
                      ),
                      TextSpan(
                          text: AppStrings.privacy,
                          style: AppTextStyle.titleSmall.copyWith(
                              color: AppColors.getColor(
                                  AppColorsEnum.secondaryColor))),
                    ]),
                  ),
                ),
              ],
            ),
          ),

          LayoutHelper.height10(),

          // Button

          (state is SignUpLoadingState)
              ? CircularProgressIndicator(
                  color: AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                )
              : CustomButtonElevated(
                  type: ButtonType.primary,
                  buttonColor:
                      AppColors.getSingleColor(AppColorsEnum.secondaryColor),
                  text: AppStrings.signUp,
                  onTap: () async {
                    _submitForm(context, signUpBloc);
                  }),

          LayoutHelper.height30(),
        ],
      ),
    );
  }

  List<String> prefixIcon = [
    ImageConstant.emailIcon,
    ImageConstant.schoolBranch,
    ImageConstant.passingYear,
    ImageConstant.passingClass,
    ImageConstant.classRollNumber,
    ImageConstant.passwordIcon,
  ];

  firstLastNameFeilds(
      {required TextEditingController controller,
      required String hintText,
      required readOnly}) {
    return Card(
      elevation: 3,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:
              BorderSide(color: AppColors.getColor(AppColorsEnum.white))),
      child: CustomInputField(
        errorMessage: "Invalid inputs",
        hint: hintText,
        readOnly: readOnly,
        textEditingController: controller,
        borderRadius: 10,
        prefixWidget: Container(
            padding: const EdgeInsets.all(12),
            width: 1,
            child: Image.asset(
              ImageConstant.accountLogo,
              width: 1,
            )),
        fillColor: AppColors.getColor(AppColorsEnum.white),
      ),
    );
  }

  List<Widget> suffixIcon(
          context, index, state, List<SchoolBranches>? schoolBranches) =>
      [
        const SizedBox(),
        InkWell(
          onTap: () {
            (state is SignUpLoadingState)
                ? () {}
                : dropdown2(
                    context: context,
                    list: schoolBranches,
                    controller: controllers[index],
                  );
          },
          child: Icon(
            Icons.expand_circle_down_rounded,
            size: 30,
            color: AppColors.getSingleColor(AppColorsEnum.primary),
          ),
        ),
        InkWell(
          onTap: () {
            (state is SignUpLoadingState)
                ? () {}
                : dropdown(
                    context: context,
                    list: passingYear,
                    controller: controllers[index]);
          },
          child: Icon(
            Icons.expand_circle_down_rounded,
            size: 30,
            color: AppColors.getSingleColor(AppColorsEnum.primary),
          ),
        ),
        InkWell(
          onTap: () {
            (state is SignUpLoadingState)
                ? () {}
                : dropdown(
                    context: context,
                    list: passingClass,
                    controller: controllers[index]);
          },
          child: Icon(
            Icons.expand_circle_down_rounded,
            size: 30,
            color: AppColors.getSingleColor(AppColorsEnum.primary),
          ),
        ),
        const SizedBox(),
        const SizedBox(),
        const SizedBox(),
      ];

  dropdown({
    required BuildContext context,
    required List<String> list,
    required TextEditingController controller,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (con) {
          return SizedBox(
            height: height * 0.32,
            child: Column(
              children: [
                LayoutHelper.height10(),
                SizedBox(
                  height: height * 0.3,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            controller.text = list[index];

                            Navigator.pop(context);
                          });
                        },
                        subtitle: Text(list[index]),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  int userId = 0;
  dropdown2({
    required BuildContext context,
    required List<SchoolBranches>? list,
    required TextEditingController controller,
  }) {
    return showModalBottomSheet(
        context: context,
        builder: (con) {
          return SizedBox(
            height: height * 0.32,
            child: Column(
              children: [
                LayoutHelper.height10(),
                SizedBox(
                  height: height * 0.3,
                  child: ListView.builder(
                    itemCount: list!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            controller.text =
                                list[index].organizationName.toString();
                            userId = list[index].id!;

                            Navigator.pop(context);
                          });
                        },
                        subtitle: Text(list[index].organizationName.toString()),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  //Signup function

  void _submitForm(context, signUpBloc) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        signUpBloc.add(SignupEvent(
            firstName: controllers[6].text,
            lastName: controllers[7].text,
            email: controllers[0].text,
            school: controllers[1].text,
            passingYear: controllers[2].text,
            passingClass: controllers[3].text,
            classRollNumber: controllers[4].text,
            password: controllers[5].text,
            context: context,
            parentUserId: userId));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          WidgetHelper.getSnackBar(
              context, e.toString(), AppColors.getColor(AppColorsEnum.red)),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        WidgetHelper.getSnackBar(context, AppStrings.pleaseCheckAllFeilds,
            AppColors.getColor(AppColorsEnum.red)),
      );
    }
  }
}