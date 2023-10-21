import 'package:alumni/Pages/Signup/UI/signup.dart';
import 'package:flutter/material.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/Pages/Sign%20in/UI/signin.dart';
import 'package:alumni/Widgets/Widgets/custom_button.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';

import '../../Widgets/Widgets/custom_text.dart';
import '../../Widgets/classes/widget_helper_class.dart';

class OnboardScreen extends StatefulWidget {
  static String routeName = '/onboarding';

  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutHelper.pageContainer(

        //Footer Button
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: _currentIndex != 2
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomButtonElevated(
                  onTap: () {
                    setState(() {
                      _currentIndex =
                          (_currentIndex + 1) % _descriptions.length;
                    });
                    _pageController.animateToPage(
                      _currentIndex,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  type: ButtonType.iconButton,
                  icon: Icons.arrow_forward_rounded,
                ),
              )
            : null,
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              //Image Slider
              Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _descriptions.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return WidgetHelper.getCachedImageWithFit(
                      _imageUrls[index],
                      BoxFit.fitWidth,
                    );
                  },
                ),
              ),

              //Slider Indicator
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: width / 2.5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _descriptions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                          width: _currentIndex == index ? 60 : 8,
                          height: 8,
                          decoration: getBoxDecorationAll(50,
                              AppColors.getSingleColor(AppColorsEnum.primary)),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              //Slider Body
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      //Slide description
                      CustomText(
                        textKey: _descriptions[_currentIndex],
                        textAlign: TextAlign.center,
                      ),

                      //Slide 3 extended
                      _currentIndex == 2
                          ? Column(
                              children: [
                                LayoutHelper.height30(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //login button
                                    CustomButtonElevated(
                                        type: ButtonType.primarySmallButton,
                                        text: AppStrings.login,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignIn()));
                                        }),

                                    LayoutHelper.width20(),

                                    //signup button
                                    CustomButtonElevated(
                                        type: ButtonType.primarySmallButton,
                                        text: AppStrings.signUp,
                                        onTap: () {
                                          navigateToPageWithoutReplaceMentNamed(
                                              Signup.routeName);
                                        }),
                                  ],
                                ),

                                //login button
                                ...WidgetHelper.getSocialLogin(() {
                                  print('facebook tap');
                                }, () {
                                  print('google tap');
                                }),
                              ],
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> _descriptions = [
    "Welcome to my app!",
    "Swipe right to continue",
    "Enjoy using the app!"
  ];
  List<String> _imageUrls = [
    "https://images.pexels.com/photos/2927080/pexels-photo-2927080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2927080/pexels-photo-2927080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2927080/pexels-photo-2927080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];
}
