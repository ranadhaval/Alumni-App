import 'package:alumni/Constants/arrays.dart';
import 'package:alumni/Constants/strings.dart';
import 'package:alumni/Pages/CreateProfile/Model/drop_down_model.dart';
import 'package:alumni/Widgets/classes/widget_helper_class.dart';
import 'package:alumni/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  List<DropDownModel> dropDown;
  int index;

  DropDownWidget({super.key, required this.dropDown, required this.index});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: class_(dropDownModel: widget.dropDown[widget.index])),
        Expanded(
            flex: 2, child: Year(dropDownModel: widget.dropDown[widget.index]))
      ],
    );
    
  }
}

// class dropdown

// ignore: must_be_immutable
class class_ extends StatefulWidget {
  DropDownModel dropDownModel;

  class_({required this.dropDownModel});
  @override
  classState createState() => classState();
}

class classState extends State<class_> {
  String? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.dropDownModel.class_;
  }

  @override
  void didUpdateWidget(class_ oldWidget) {
    if (oldWidget.dropDownModel.class_ != widget.dropDownModel.class_) {
      _value = widget.dropDownModel.class_;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetHelper.newDropDown(
                  errorMessage: "Choose class",

          dropDownTileColor:
              AppColors.getColor(AppColorsEnum.cityAndCountryFeildColor),
          arrayList: className,
          onChange: (value) {
            setState(() {
              _value = value!;
              widget.dropDownModel.class_ = value;
            });
          },
          selectedvalue: _value,
          hint: AppStrings.class_),
    );
  }
}

// year dropdown

// ignore: must_be_immutable
class Year extends StatefulWidget {
  DropDownModel dropDownModel;

  Year({required this.dropDownModel});
  @override
  YearState createState() => YearState();
}

class YearState extends State<Year> {
  String? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.dropDownModel.year;
  }

  @override
  void didUpdateWidget(Year oldWidget) {
    if (oldWidget.dropDownModel.year != widget.dropDownModel.year) {
      _value = widget.dropDownModel.year;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WidgetHelper.newDropDown(
                  errorMessage: "Choose year",

          dropDownTileColor:
              AppColors.getColor(AppColorsEnum.cityAndCountryFeildColor),
          arrayList: year,
          onChange: (value) {
            setState(() {
              _value = value!;
              widget.dropDownModel.year = value;
            });
          },
          selectedvalue: _value,
          hint: AppStrings.year),
    );
  }
}
