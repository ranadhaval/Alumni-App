import 'package:alumni/Blocs/HomeBloc/HomeState/home_state.dart';
import 'package:alumni/Blocs/HomeBloc/home_bloc.dart';
import 'package:alumni/Constants/image_constant.dart';
import 'package:alumni/Pages/Event/event.dart';
import 'package:alumni/Pages/Home/home_module.dart';
import 'package:alumni/Pages/MyAlumni/UI/alumni.dart';
import 'package:alumni/Pages/MyFeed/UI/my_feed.dart';
import 'package:alumni/Pages/Groups/Group.dart';
import 'package:alumni/Widgets/Widgets/appbar.dart';
import 'package:alumni/Widgets/Widgets/custom_text.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/layout_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  navigationBarItem(
      {required String title,
      required String icon,
      required bool clicked,
      void Function()? onTap,
      bool isSvgIcon = false}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: SizedBox(
                height: height * 0.032,
                width: width * 0.06,
                child: isSvgIcon
                    ? SvgPicture.asset(
                        icon,
                        color: clicked
                            ? AppColors.getColor(AppColorsEnum.secondaryColor)
                            : AppColors.getColor(AppColorsEnum.white),
                      )
                    : Image(
                        image: AssetImage(icon),
                        fit: BoxFit.cover,
                      )),
          ),
          LayoutHelper.height3(),
          CustomText(
            textKey: title,
            size: 9,
            color: clicked
                ? AppColors.getColor(AppColorsEnum.secondaryColor)
                : AppColors.getColor(AppColorsEnum.white),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeMainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutHelper.pageContainerWithoutScroll(
            appBar: appBar(
                color: AppColors.getColor(
              AppColorsEnum.gray200,
            )),
            bottomNavigationBar: bottomNavBar(),
            child: Builder(builder: (context) {
              switch (index) {
                case 1:
                  return const HomeModule();
                case 2:
                  return const MyFeed();
                case 3:
                  return const Event();
                case 4:
                  return const Alumni();
                case 5:
                  return const Group();

                default:
                  return const HomeModule();
              }
            }));
      },
    );
  }

  shareUpdate() {
    return showModalBottomSheet(
        context: context,
        builder: (con) {
          return Container(
            height: height * 0.3,
          );
        });
  }

  bottomNavBar() {
    return Container(
      height: height * 0.07,
      color: AppColors.getColor(AppColorsEnum.primary),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navigationBarItem(
                  title: "Home",
                  icon: ImageConstant.homeIcon,
                  clicked: index == 1,
                  isSvgIcon: true,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                navigationBarItem(
                  title: "My Feeds",
                  icon: ImageConstant.clone,
                  isSvgIcon: true,
                  clicked: index == 2,
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                navigationBarItem(
                  title: "Events",
                  icon: ImageConstant.event,
                  isSvgIcon: true,
                  clicked: index == 3,
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
                navigationBarItem(
                  title: "My Alumni's",
                  icon: ImageConstant.alumni_,
                  isSvgIcon: true,
                  clicked: index == 4,
                  onTap: () {
                    setState(() {
                      index = 4;
                    });
                  },
                ),
                navigationBarItem(
                  title: "Groups",
                  icon: ImageConstant.group,
                  isSvgIcon: true,
                  clicked: index == 5,
                  onTap: () {
                    setState(() {
                      index = 5;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int index = 1;
}
