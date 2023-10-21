import 'package:alumni/Blocs/MainBloc/MainBlocEvent/main_bloc_event.dart';
import 'package:alumni/Blocs/MainBloc/MainBlocState/main_bloc_state.dart';
import 'package:alumni/Blocs/MainBloc/main_bloc.dart';
import 'package:alumni/Blocs/SignUpBloc/signup_bloc.dart';
import 'package:alumni/Blocs/SignUpBloc/signup_event/signup_event.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Sign%20in/Model/Response/get_school_branches.dart';
import 'package:alumni/Pages/Signup/UI/signup.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Constants/strings.dart';
import '../../../themeFiles/app_typography.dart';
import '../../../themeFiles/layout_helper.dart';

class SignIn extends StatefulWidget {
  static String routeName = '/signin';
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    return LayoutHelper.pageContainer(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        backgroundColor: AppColors.getColor(AppColorsEnum.secondaryColor),
        horizontalPadding: 15,
        appBar: appBar(
            color: AppColors.getColor(AppColorsEnum.secondaryColorAppbar)),
        child: BlocConsumer<MainBloc, MainBlocState>(
          listener: (context, state) {
            if (state is SigninErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                WidgetHelper.getSnackBar(context, state.Error, Colors.red),
              );
            }
          },
          builder: (context, state) {
            return _body(context, mainBloc, state);
          },
        ));
  }

  _body(context, MainBloc mainBloc, state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LayoutHelper.height20(),
          Image.asset(
            ImageConstant.alumniLogo,
            height: height * 0.1,
          ),
          LayoutHelper.height20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor:
                    AppColors.getSingleColor(AppColorsEnum.primary),
              ),
              LayoutHelper.width10(),
              CustomText(
                  textKey: AppStrings.signIn,
                  style: AppTextStyle.titleLarge,
                  textAlign: TextAlign.center,
                  color: AppColors.getSingleColor(AppColorsEnum.primary)),
              Text(
                AppStrings.devider,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.getSingleColor(AppColorsEnum.white)),
              ),
              InkWell(
                onTap: (() {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                                create: (context) =>
                                    SignUpBloc()..add(GetBranchEvent()),
                                child: Signup(),
                              )),
                      (route) => false);
                }),
                child: CustomText(
                  textKey: AppStrings.register,
                  style: AppTextStyle.titleLarge,
                  textAlign: TextAlign.center,
                  color: AppColors.getSingleColor(AppColorsEnum.white),
                ),
              ),
            ],
          ),
          LayoutHelper.height30(),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              textKey: AppStrings.enterDetailsToLogin,
              style: AppTextStyle.bodyLarge.copyWith(fontSize: 18),
              textAlign: TextAlign.left,
              color: AppColors.getSingleColor(AppColorsEnum.white),
            ),
          ),
          LayoutHelper.height10(),
          for (int i = 0; i < 2; i++)
            ...WidgetHelper.getNameAndInputField(
              names[i],
              mainBloc.controllers[i],
              context,
              isEmail: i == 0 ? true : false,
              // isPass: i == 1,
              readOnly: (state is LodingState) ? true : false,
              isShowPass: i == 1 ? !isShowPass : false,
              suffixicon: i == 1
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isShowPass = !isShowPass;
                        });
                      },
                      child: isShowPass
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off))
                  : null,
              isShowIcon: true,
              prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  width: 1,
                  child: Image.asset(
                    i == 0
                        ? ImageConstant.emailIcon
                        : ImageConstant.passwordIcon,
                    width: 1,
                  )),
            ),
          LayoutHelper.height15(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(
                        AppColors.getColor(AppColorsEnum.white)),
                    checkColor: AppColors.getColor(AppColorsEnum.black),
                    value: mainBloc.rememberMe,
                    onChanged: ((value) {
                      setState(() {
                        mainBloc.rememberMe = !mainBloc.rememberMe;
                      });
                      mainBloc.add(SigninRememberMeEvent(
                          rememberMe: mainBloc.rememberMe));
                    }),
                    visualDensity: VisualDensity.compact,
                  ),
                  CustomText(
                    textKey: AppStrings.rememberMe,
                    color: AppColors.getSingleColor(AppColorsEnum.white),
                  ),
                ],
              ),
              CustomText(
                textKey: AppStrings.forgetPassword,
                color: AppColors.getSingleColor(AppColorsEnum.white),
              ),
            ],
          ),
          LayoutHelper.height30(),
          (state is LodingState)
              ? const CircularProgressIndicator()
              : CustomButtonElevated(
                  type: ButtonType.primary,
                  text: AppStrings.login,
                  onTap: () async {
                    completeSignin(context, mainBloc);
                  }),
          LayoutHelper.height30(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: AppStrings.acceptTerms,
                  style: AppTextStyle.bodyMedium.copyWith(
                      color: AppColors.getColor(AppColorsEnum.white))),
              TextSpan(
                text: AppStrings.terms,
                style: AppTextStyle.titleSmall
                    .copyWith(color: AppColors.getColor(AppColorsEnum.primary)),
              ),
              TextSpan(
                text: AppStrings.and,
                style: AppTextStyle.bodyMedium
                    .copyWith(color: AppColors.getColor(AppColorsEnum.white)),
              ),
              TextSpan(
                  text: AppStrings.privacy,
                  style: AppTextStyle.titleSmall.copyWith(
                      color: AppColors.getColor(AppColorsEnum.primary))),
            ]),
          )
        ],
      ),
    );
  }

  bool isShowPass = false;
  // bool rememberMe = false;

  final _formKey = GlobalKey<FormState>();

  // List<TextEditingController> controllers = getTextController(2);
  List<String> names = [
    AppStrings.enterRegisteredEmail,
    AppStrings.password,
  ];

  void completeSignin(context, mainBloc) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      mainBloc.add(SigninEvent(
          username: mainBloc.controllers[0].text,
          password: mainBloc.controllers[1].text,
          context: context));
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        WidgetHelper.getSnackBar(
            context!, AppStrings.pleaseCheckAllFeilds, Colors.red),
      );
    }
  }
}
