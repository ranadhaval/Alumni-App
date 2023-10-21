// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:alumni/Core/extension.dart';
import '../../Constants/colors.dart';
import 'package:email_validator/email_validator.dart';

class CustomInputField extends StatefulWidget {
  final String hint;
  final String label;
  final bool isNumber;
  final bool isExperience;
  final bool containDecimal;
  final bool isEmail;
  final bool isOtp;
  final bool isWeb;
  final bool isName;
  final bool isRequired;
  bool isPassword;
  final String errorMessage;
  final String initialValue;
  final bool isMobileNumber;
  final Icon hintIcon;
  final bool searchIcon;
  final bool isFocused;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final bool isEditable;
  final double? borderRadius;
  final Color? fillColor;
  Widget? suffixIcon;
  bool showPasswordEye;
  bool password;
  Widget? prefixWidget;
  int? maxLines;
  final TextEditingController textEditingController;
  double enabledBorderWidth;
  double verticalContentPadding;
  double horizontalContentPadding;
  bool allBorderdisable;
  TextStyle hintstyle;
  bool readOnly;
  void Function()? onTap;
  CustomInputField({
    Key? key,
    this.readOnly = false,
    required this.hint,
    this.label = "",
    this.isFocused = false,
    this.focusNode,
    this.textAlign = TextAlign.left,
    this.isEditable = true,
    this.isNumber = false,
    this.isRequired = false,
    this.isExperience = false,
    this.containDecimal = false,
    this.isEmail = false,
    this.showPasswordEye = false,
    this.isOtp = false,
    this.isWeb = false,
    this.isName = false,
    this.searchIcon = false,
    this.isPassword = false,
    this.errorMessage = "",
    this.initialValue = "",
    this.password = false,
    this.suffixIcon,
    this.borderRadius,
    this.fillColor,
    this.onTap,
    this.hintstyle =
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
    this.enabledBorderWidth = 1.2,
    this.verticalContentPadding = 5,
    this.horizontalContentPadding = 10.0,
    this.allBorderdisable = false,
    this.hintIcon = const Icon(
      Icons.keyboard,
    ),
    this.prefixWidget,
    required this.textEditingController,
    this.isMobileNumber = false,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  CustomInputFieldState createState() => CustomInputFieldState();
}

class CustomInputFieldState extends State<CustomInputField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != "") {
      widget.textEditingController.text = widget.initialValue;
    }
    return TextFormField(
      onTap: widget.onTap,
      style: TextStyle(fontSize: 14),
      textAlign: widget.textAlign!,
      enabled: widget.isEditable,
      autofocus: widget.isFocused,
      focusNode: widget.focusNode,
      cursorColor: primaryColor,
      maxLines: widget.maxLines,
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) {
            return newValue;
          }
          if (widget.isMobileNumber || widget.isNumber) {
            if (double.tryParse(newValue.text) == null) {
              return oldValue;
            }

            if (newValue.text.contains(" ")) {
              return oldValue;
            }
            if (newValue.text.toString().contains("+") ||
                newValue.text.toString().contains("-") ||
                newValue.text.toString().contains(".")) {
              return oldValue;
            }
            if (widget.isMobileNumber) {
              if (newValue.text.length == 10) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 10) {
                return oldValue;
              }
            }
            if (widget.isOtp) {
              if (newValue.text.length == 6) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 6) {
                return oldValue;
              }
            }
            if (widget.isExperience) {
              if (newValue.text.length == 3) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 3) {
                return oldValue;
              }
            }
          }

          return newValue;
        })
      ],
      readOnly: widget.readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.verticalContentPadding,
            horizontal: widget.horizontalContentPadding),
        errorText: errorText != null ? errorText!.translate() : errorText,
        focusColor: primaryColor,
        hintText: widget.hint.translate(),
        filled: true,
        enabled: true,
        hintStyle: widget.hintstyle,
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget.allBorderdisable
                  ? Colors.transparent
                  : textFieldLightColor,
              width: widget.enabledBorderWidth),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  widget.allBorderdisable ? Colors.transparent : primaryColor,
              width: 1.2),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  widget.allBorderdisable ? Colors.transparent : primaryColor,
              width: 1.2),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
        ),
        prefixIcon: widget.prefixWidget,
        suffixIcon: widget.suffixIcon,
      ),
      keyboardType: widget.isMobileNumber
          ? TextInputType.phone
          : widget.isNumber
              ? widget.containDecimal
                  ? const TextInputType.numberWithOptions(
                      signed: false, decimal: true)
                  : const TextInputType.numberWithOptions(
                      signed: false, decimal: false)
              : TextInputType.text,
      validator: (value) {
        return checkValue(value);
      },
      onChanged: (value) {
        errorText = checkValue(value);
        setState(() {});
      },
      obscureText: widget.password,
      controller: widget.textEditingController,
    );
  }

  checkValue(value) {
    if (widget.errorMessage != "") {
      if (value == "") return widget.errorMessage;

      if (widget.isMobileNumber) {
        if (widget.isOtp) {
          if (value!.length != 6) {
            return widget.errorMessage;
          }
        } else if (value!.length != 10) {
          return widget.errorMessage;
        } else if (double.tryParse(value) == null) {
          return widget.errorMessage;
        } else if (value.toString().contains(" ") ||
            value.toString().endsWith(" ")) {
          return widget.errorMessage;
        } else if (value.toString().contains("+") ||
            value.toString().contains("-") ||
            value.toString().contains(".")) {
          return widget.errorMessage;
        }
      } else if (widget.isPassword) {
        if (value!.length < 6) return widget.errorMessage;
      } else if (widget.isNumber) {
        bool isNum = double.tryParse(value) != null;
        if (!isNum) {
          return "Only numbers are required";
        }
      } else if (widget.isName) {
        if (value != null) {
          bool isNum = double.tryParse(value) != null;
          if (isNum || value.length < 3) {
            return widget.errorMessage;
          }
        }
      } else if (widget.isEmail) {
        if (EmailValidator.validate(value) == false) {
          return "Input Valid Email-Id";
        }
      }
    }
    return null;
  }
}
