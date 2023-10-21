import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:alumni/Functions/common.dart';
import 'package:alumni/main.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:alumni/themeFiles/app_typography.dart';
import 'package:alumni/themeFiles/layout_helper.dart';

import '../../Constants/colors.dart';
import '../../Constants/image_constant.dart';
import '../Widgets/custom_edit_text_white_back.dart';
import '../Widgets/custom_text.dart';

class AppBarDesigns {
  // appbar to display title and drawer or actions (optional)
  // static getTitleAndDrawerAppbarWithProfile(Widget? leading,
  //     {List<Widget>? actions}) {
  //   UserModel? model;
  //   return AppBar(
  //     leading: leading,
  //     centerTitle: true,
  //     title: Image.asset(ImageConstant.imgLogo),
  //     actions: [
  //       //when image is not there
  //       model!.image == ""
  //           ? const Icon(Icons.person)

  //           // when image is there
  //           : Padding(
  //               padding: EdgeInsets.only(right: 15),
  //               child: WidgetHelper().getCircularAvatar(model.image),
  //             ),
  //       SizedBox(
  //         width: 10,
  //       )
  //     ],
  //   );
  // }

  static getTitleAndDrawerAppbarWithNotification(
      BuildContext context, Widget? leading,
      {List<Widget>? actions, TextEditingController? textEditingController}) {
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: Image.asset(
        ImageConstant.imgLogo,
        width: 120,
      ),
      actions: [
        //when image is not there
        const Icon(MaterialSymbols.notifications),
        LayoutHelper.width10(),
      ],
      bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.1),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: CustomInputField(
              textEditingController: textEditingController!,
              //suffixIcon: Icon(MaterialSymbols.search),
              hint: 'Search product..',
            ),
          )),
    );
  }

  // appbar for displaying title and back button
  static getAppbarWithBackAndTitle(BuildContext context, String? title,
      {double? elevation, List<Widget>? actions}) {
    return ClipRRect(
      borderRadius: getBorderRadiusTop(15),
      child: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        backgroundColor: AppColors.getColor(AppColorsEnum.background),
        elevation: 0,
        title: CustomText(
          textKey: title!,
          style: AppTextStyle.titleLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop(0);
                }
              },
              icon: const Icon(Icons.close_rounded))
        ],
      ),
    );
  }

  // app bar with zero height
  static getAppBar(String title) {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          bool canPop = ModalRoute.of(context)?.canPop ?? false;
          return canPop
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: AppColors.getColor(AppColorsEnum.invert),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container();
        },
      ),
      title: CustomText(
        textKey: title,
        style: Theme.of(navigatorKey.currentContext!).textTheme.titleMedium,
      ),
      backgroundColor:
          Theme.of(navigatorKey.currentContext!).scaffoldBackgroundColor,
    );
  }

  //app bar with title only
  static getAppTitleOnly(String title) {
    return AppBar(
      title: CustomText(
        textKey: title,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
