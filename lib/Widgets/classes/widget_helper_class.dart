import 'package:alumni/Constants/image_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:alumni/main.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Models/Common/cardmodel.dart';
import '../../themeFiles/app_colors.dart';
import '../../themeFiles/app_typography.dart';
import '../../themeFiles/layout_helper.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_edit_text_white_back.dart';
import '../Widgets/custom_text.dart';
import '../Widgets/custom_text_string.dart';

//all other widgets
class WidgetHelper {
  //widget to show row with text and forward arrow
  static Widget getRowIcon(String text,
      {IconData iconData = Icons.arrow_forward_ios_rounded,
      Function? onClick}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(textKey: text),
        InkWell(
          onTap: () {
            if (onClick != null) {
              onClick();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(textKey: AppStrings.add),
              Icon(
                iconData,
                color: Colors.black54,
                size: 14,
              )
            ],
          ),
        ),
      ],
    );
  }

  static getTitlewithValue(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          textKey: title,
          style: AppTextStyle.titleLarge,
        ),
        CustomText(
          textKey: value,
          style: AppTextStyle.titleLarge,
        )
      ],
    );
  }

  static getTitleValueItemWidget(TitlewithValueModel titleModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(textKey: titleModel.title),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomText(textKey: titleModel.value),
        ),
      ],
    );
  }

  static getTitlewithDivider(
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 10),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: CustomText(
              textKey: title,
              style: Theme.of(navigatorKey.currentContext!)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                      color: AppColors.getColor(AppColorsEnum.subHeading)),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }

  //Snackbar
  static getSnackBar(BuildContext context, String msg, Color backgroundColor) {
    return SnackBar(
      margin: const EdgeInsets.all(0),
      elevation: 0,
      content: CustomText(
        textKey: msg,
        color: AppColors.getSingleColor(AppColorsEnum.white),
      ),
      backgroundColor: backgroundColor,
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
  }

  //

  //ListTile
  static getListTile({
    required ListTileModel listTile,
  }) {
    return ListTile(
      onTap: listTile.onTap,
      shape: listTile.radius,
      hoverColor: AppColors.getColor(AppColorsEnum.background),
      tileColor: AppColors.getColor(AppColorsEnum.lintColor),
      leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: getBoxDecorationAll(
              50, AppColors.getColor(AppColorsEnum.background)),
          child: Icon(
            listTile.icon,
            color: AppColors.getSingleColor(AppColorsEnum.primary),
          )),
      title: CustomText(textKey: listTile.title),
      trailing: listTile.enableIcon == true
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.getSingleColor(AppColorsEnum.primary),
              size: 14,
            )
          : listTile.toggle ?? const SizedBox(),
    );
  }

  //ListTile with Image
  static getListTileWithImage({
    required String image,
    required String title,
    required String quantity,
    required dynamic onTap,
  }) {
    return ListTile(
      horizontalTitleGap: 20,
      minVerticalPadding: 25,
      onTap: onTap,
      hoverColor: AppColors.getColor(AppColorsEnum.background),
      leading: SizedBox(
        width: width / 3.5,
        child: Container(
            decoration: getBoxDecorationAll(
                15, AppColors.getColor(AppColorsEnum.background)),
            child: WidgetHelper.getCachedImageWithFit(image, BoxFit.fitWidth,
                borderRadius: 15)),
      ),
      title: CustomText(textKey: title),
      subtitle: Text.rich(TextSpan(text: "", children: [
        TextSpan(text: quantity),
        const TextSpan(text: " "),
        WidgetSpan(
          child: CustomText(textKey: AppStrings.items),
        ),
      ])),
      trailing: SizedBox(
        width: 20,
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.getSingleColor(AppColorsEnum.primary),
            size: 14,
          ),
        ),
      ),
    );
  }

  //widget to get text field with title
  static getNameAndInputField(
      String name, TextEditingController controller, BuildContext context,
      {bool isEmail = false,
      bool isPass = false,
      bool isMob = false,
      bool isNum = false,
      bool isShowPass = false,
      bool isShowIcon = false,
      Widget? prefixIcon,
      Widget? suffixicon,
      Color? fillColor,
      double enabledBorderWidth = 1.2,
      double horizontalContentPadding = 10,
      double verticalContentPadding = 5,
      bool allBorderdisable = false,
      int maxlines = 1,
      bool readOnly = false,
      double? borderRadius,
      void Function()? onTap,
      double width = 64}) {
    return <Widget>[
      // Align(
      //     alignment: Alignment.bottomLeft,
      //     child: CustomText(
      //         textKey: name,
      //         style: AppTextStyle.bodySmall!.copyWith(
      //           color: AppColors.getColor(AppColorsEnum.subHeading),
      //         ))),
      Card(
        elevation: 3,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: Colors.white)),
        child: CustomInputField(
          errorMessage: "Invalid inputs",
          onTap: onTap,
          readOnly: readOnly,
          allBorderdisable: allBorderdisable,
          hint: name,
          textEditingController: controller,
          borderRadius: borderRadius,
          isEmail: isEmail,
          isPassword: isPass,
          isMobileNumber: isMob,
          isNumber: isNum,
          password: isShowPass,
          suffixIcon: suffixicon,
          prefixWidget: isShowIcon ? prefixIcon : null,
          fillColor: fillColor,
          enabledBorderWidth: enabledBorderWidth,
          verticalContentPadding: verticalContentPadding,
          horizontalContentPadding: horizontalContentPadding,
          maxLines: maxlines,
        ),
      ),
      LayoutHelper.height5()
    ];
  }

  //widget to get text field with title
  static getNameAndInputMobileField(
      String name,
      String countryCode,
      TextEditingController countryCodeTextController,
      TextEditingController controller,
      BuildContext context,
      {bool isEmail = false,
      bool isPass = false,
      bool isMob = false,
      bool isNum = false,
      bool isShowPass = false,
      double width = 64}) {
    return <Widget>[
      // Align(
      //     alignment: Alignment.bottomLeft,
      //     child: CustomText(
      //         textKey: name,
      //         style: AppTextStyle.bodySmall!.copyWith(
      //           color: AppColors.getColor(AppColorsEnum.subHeading),
      //         ))),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomInputField(
              hint: countryCode,
              textEditingController: countryCodeTextController,
              textAlign: TextAlign.center,
              isEmail: isEmail,
              isPassword: isPass,
              isMobileNumber: isMob,
              isNumber: isNum,
              password: isShowPass,
            ),
          ),
          LayoutHelper.width10(),
          Expanded(
            flex: 7,
            child: CustomInputField(
              hint: name,
              textEditingController: controller,
              isEmail: isEmail,
              isPassword: isPass,
              isMobileNumber: isMob,
              isNumber: isNum,
              password: isShowPass,
            ),
          ),
        ],
      ),
      LayoutHelper.height20()
    ];
  }

  static getSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/alumni-icon.png',
                width: 10,
              )),
          LayoutHelper.width10(),
          Expanded(
              flex: 8,
              child: CustomInputField(
                hint: AppStrings.search,
                textEditingController: TextEditingController(),
                searchIcon: true,
                borderRadius: 25,
                hintIcon: const Icon(Icons.search),
              ))
        ],
      ),
    );
  }

  static getSocialLogin(Function facebookOnTap, Function googleOnTap) {
    return <Widget>[
      WidgetHelper.getTitlewithDivider(
        AppStrings.continueWith,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonElevated(
              type: ButtonType.socialButton,
              text: 'assets/images/facebook.svg',
              onTap: () => facebookOnTap.call()),
          LayoutHelper.width20(),
          SizedBox(
            height: 30,
            width: 1,
            child: Container(color: Colors.grey),
          ),
          LayoutHelper.width20(),
          CustomButtonElevated(
              type: ButtonType.socialButton,
              text: 'assets/images/google.svg',
              onTap: () => googleOnTap.call()),
        ],
      ),
    ];
  }

  static getTitlewithNumber(
      BuildContext context, String? title, int? itemNumber) {
    return Row(children: [
      CustomText(
        textKey: title!,
        color: Theme.of(context).primaryColor,
        style: AppTextStyle.titleMedium,
      ),
      Text.rich(
        TextSpan(
            text: " (",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: itemNumber!.toString(),
              ),
              const TextSpan(
                text: ")",
              )
            ]),
      ),
    ]);
  }

  getBottomButton(String textKey, Function onClick) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
      child: CustomButtonElevated(
          type: ButtonType.primary, text: textKey, onTap: onClick),
    );
  }

  static TextStyle getTextStyle(bool bold, double size, Color color) {
    return TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontFamily: AppStrings.font,
        fontSize: size);
  }

  //TODO: Need to pass translation
  static Widget getRichText(String text1, String text2,
      {Color? text1Color, required bool isBold}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: isBold
                ? AppTextStyle.titleSmall.copyWith(
                    color: text1Color ??
                        AppColors.getColor(AppColorsEnum.subHeading))
                : AppTextStyle.titleSmall.copyWith(
                    color: text1Color ??
                        AppColors.getColor(AppColorsEnum.subHeading))),
        TextSpan(
            text: text2,
            style: isBold
                ? AppTextStyle.titleSmall.copyWith(
                    color: text1Color ??
                        AppColors.getColor(AppColorsEnum.subHeading))
                : AppTextStyle.titleSmall.copyWith(
                    color: text1Color ??
                        AppColors.getColor(AppColorsEnum.subHeading))),
      ]),
    );
  }

  static Widget getRichTextwithCustomText(String text1, String text2) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
            child: CustomText(textKey: text1),
            style: getTextStyle(true, 15.0,
                AppColors.getSingleColor(AppColorsEnum.secondaryColor))),
        TextSpan(
          text: " ",
          style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
        ),
        TextSpan(
          text: text1,
          style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
        ),
      ]),
    );
  }

  //TODO: Need to pass Translation text
  static Widget getRichTextWithTextButton(
      String text1, String text2, Function() onTap) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge),
        const TextSpan(text: "  "),
        TextSpan(
          text: text2,
          style: Theme.of(navigatorKey.currentContext!)
              .primaryTextTheme
              .titleMedium!
              .copyWith(
                  color:
                      AppColors.getSingleColor(AppColorsEnum.secondaryColor)),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ]),
    );
  }

  static Widget getRichTextWithUnderlineTextButton(
      String text1, String text2, Function() onTap) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium),
        const TextSpan(text: "  "),
        TextSpan(
          text: text2,
          style: AppTextStyle.titleSmall
              .copyWith(decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ]),
    );
  }

  Widget getBackButton(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return IconButton(
        onPressed: () {
          if (canPop) {
            Navigator.pop(context);
          }
        },
        icon: canPop
            ? Icon(
                Icons.arrow_back,
                color: AppColors.getColor(AppColorsEnum.background),
              )
            : const SizedBox());
  }

  Widget getDividerApp() {
    return const Divider(
      thickness: 1,
      color: primaryColor,
    );
  }

  Widget getDividerAsh() {
    return const Divider(
      thickness: 1,
      color: dividerColor,
    );
  }

  Widget getDividerAshThick() {
    return const Divider(
      thickness: 2.5,
      color: dividerColor,
    );
  }

  Widget getDividerAshLight() {
    return const Divider(
      thickness: 0.5,
      color: dividerColor,
    );
  }

  Widget getCachedImage(String image, double height, double width) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage);
        return FadeInImage(
          placeholder: Image.memory(kTransparentImage).image,
          image: imageProvider,
        );
      },
    );
  }

  static Widget getCachedImageWithFit(String image, BoxFit? fit,
      {double borderRadius = 0, height}) {
    //TODO
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) {
          return FadeInImage(
            placeholder: Image.memory(kTransparentImage).image,
            image: imageProvider,
            fit: fit,
          );
        },
      ),
    );
  }

  Widget getCachedNetworkImage(
    String image,
  ) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage);
        return FadeInImage(
          placeholder: Image.memory(kTransparentImage).image,
          image: imageProvider,
        );
      },
    );
  }

  Widget getCircularCachedImage(String image, double height, double width) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage);
        return CircleAvatar(
          backgroundColor: transparentColor,
          foregroundImage: imageProvider,
        );
      },
    );
  }

  Widget getCachedImageWithout(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage, image: image);
        return FadeInImage(
          placeholder: Image.memory(kTransparentImage).image,
          image: imageProvider,
        );
      },
    );
  }

  Widget getCircularAvatar(String image, {double maxRadius = 16}) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          foregroundImage: imageProvider,
          maxRadius: maxRadius,
        );
      },
    );
  }

  //Widget to create a drop down
  static Widget getDropDown(String hint, int selectedValue, Function onChange,
      List<String> valueArrray, Widget? icon,
      {FocusNode? focusNode,
      dynamic onTap,
      TextEditingController? textEditingController}) {
    return Container(
      decoration: getBoxDecorationAll(
          5, AppColors.getSingleColor(AppColorsEnum.lintColor)),
      child: DropdownButton<String>(
        alignment: AlignmentDirectional.centerStart,
        isExpanded: true,
        underline: const SizedBox(),
        focusNode: focusNode,
        onTap: () => onTap,
        iconSize: 30,
        icon: icon,
        borderRadius: getBorderRadiusAll(5),
        dropdownColor: AppColors.getSingleColor(AppColorsEnum.lintColor),
        iconEnabledColor: AppColors.getColor(AppColorsEnum.primary),
        //hint not working
        hint: Text(
          hint,
          style: TextStyle(color: AppColors.getColor(AppColorsEnum.invert)),
        ),
        items: valueArrray.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CustomText(
                textKey: value,
                bold: true,
              ),
            ),
          );
        }).toList(),
        value: valueArrray[selectedValue],
        onChanged: (value) {
          onChange(value);
        },
      ),
    );
  }

  static Widget inputHeadingTile(
      {required String title, double leftPadding = 5}) {
    return Column(
      children: [
        LayoutHelper.height15(),
        Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(ImageConstant.defaultUser),
              ),
              CustomText(textKey: title),
            ],
          ),
        ),
        LayoutHelper.height5(),
      ],
    );
  }

  static Widget newDropDown({
    List<String>? arrayList,
    Function? onChange,
    String? selectedvalue,
    Color dropDownTileColor = Colors.white,
    String? hint,
    Color textColor = Colors.black,
    bool iconVisible = true,
    double elevation = 3,
    Color dropDownBackgroundColor = Colors.white,
    required String errorMessage,
    Widget suffixWidget = const Padding(
      padding: EdgeInsets.all(2.0),
      child: Icon(
        Icons.expand_circle_down_rounded,
        size: 22,
        color: Color(0xff52366C),
      ),
    ),
    Color hintTextColor = Colors.grey,
  }) {
    return Card(
      elevation: elevation,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: dropDownTileColor)),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 5),
        decoration: BoxDecoration(
          color: dropDownTileColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              dropdownColor: dropDownBackgroundColor,
              focusColor: dropDownTileColor,
              icon: !iconVisible ? Container() : suffixWidget,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              borderRadius: BorderRadius.circular(15),
              style: TextStyle(color: textColor),
              isExpanded: true,
              value: selectedvalue,
              validator: (value) => value == null ? errorMessage : null,
              hint: Text(
                hint!,
                style: TextStyle(
                    color: hintTextColor, fontWeight: FontWeight.w300),
              ),
              items: arrayList!.map((String title) {
                return DropdownMenuItem<String>(
                    value: title, child: Text(title));
              }).toList(),
              onChanged: (value) {
                onChange!(value);
              }),
        ),
      ),
    );
  }

  static Widget simpleDropDown({
    List<String>? arrayList,
    Function? onChange,
    String? selectedvalue,
    Color dropDownTileColor = Colors.white,
    String? hint,
    Color textColor = Colors.black,
    bool iconVisible = true,
    double elevation = 3,
    Color dropDownBackgroundColor = Colors.white,
    Widget suffixWidget = const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.expand_circle_down_rounded,
        size: 30,
        color: Color(0xff52366C),
      ),
    ),
    Color hintTextColor = Colors.grey,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 5),
      decoration: BoxDecoration(
        color: Color(0xff52366C),
        //   // borderRadius: BorderRadius.circular(7),
      ),
      child: DropdownButton<String>(
          padding: EdgeInsets.all(0),
          elevation: 0,
          borderRadius: BorderRadius.circular(7),
          dropdownColor: dropDownBackgroundColor,
          focusColor: dropDownTileColor,
          icon: !iconVisible ? Container() : suffixWidget,
          underline: Container(
            height: 20,
            color: Colors.transparent,
          ),
          style: TextStyle(color: textColor),
          isExpanded: true,
          value: selectedvalue,
          hint: Text(
            hint!,
            style: TextStyle(color: hintTextColor, fontWeight: FontWeight.w300),
          ),
          items: arrayList!.map((String title) {
            return DropdownMenuItem<String>(value: title, child: Text(title));
          }).toList(),
          onChanged: (value) {
            onChange!(value);
          }),
    );
  }

  static Widget getDropDownSheet(dynamic onTap, String hint) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.getSingleColor(AppColorsEnum.lintColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(
              textKey: hint,
              style: AppTextStyle.titleSmall,
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  //Profile Info Container
  Widget getInfoContainers(
      BuildContext context, String? image, String? label, String? text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: getBoxDecorationAll(20, textFieldLightColor),
      child: Row(
        children: [
          WidgetHelper().getCachedImage(image!, 50, 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  textKey: label!,
                  capatilize: true,
                  style: getTextStyle(
                      false, 14, AppColors.getColor(AppColorsEnum.invert))),
              CustomTextString(
                  text: text!,
                  capatilize: true,
                  style: getTextStyle(true, 16, primaryColor))
            ],
          )
        ],
      ),
    );
  }

  //for profile address box
  Widget getInfoText(BuildContext context, String? label, String? text) {
    return Row(
      children: [
        SizedBox(
          height: height * 0.18,
          child: CustomText(
              textKey: label!,
              capatilize: true,
              style: getTextStyle(
                  false, 14, AppColors.getColor(AppColorsEnum.invert))),
        ),
        CustomText(
          textKey: ": ", //TODO
          style: getTextStyle(false, 14, primaryColor),
        ),
        CustomTextString(
            text: text!,
            capatilize: true,
            style: getTextStyle(true, 14, primaryColor))
      ],
    );
  }
}
