// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../Constants/strings.dart';
import '../../Services/shared_helper.dart';
import '../../themeFiles/app_colors.dart';

class CustomText extends StatelessWidget {
  String textKey;
  bool bold;
  Color? color = AppColors.getColor(AppColorsEnum.invert);
  TextAlign textAlign;
  double size;
  bool capatilize;
  bool showLine;
  bool underLine;
  bool semiBold;
  int? maxLines;
  TextOverflow? overflow;

  TextStyle? style;
  CustomText({
    Key? key,
    required this.textKey,
    this.bold = false,
    this.capatilize = false,
    this.size = 14,
    this.color,
    this.textAlign = TextAlign.left,
    this.showLine = false,
    this.underLine = false,
    this.semiBold = false,
    this.style,
    this.maxLines =1,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? style2 = TextStyle(
      decoration: showLine
          ? TextDecoration.lineThrough
          : underLine
              ? TextDecoration.underline
              : TextDecoration.none,
      fontWeight: bold
          ? FontWeight.bold
          : semiBold
              ? FontWeight.w400
              : FontWeight.normal,
      fontSize: size,
    );

    if (style != null) {
      style2 = style;
    }

    var a1 = Text(SharedHelper.getTranslatedText(textKey),
        textAlign: textAlign, style: style2!.copyWith(color: color));

    return capatilize
        ? Text(SharedHelper.getTranslatedText(textKey).toUpperCase(),
            textAlign: textAlign, style: style2.copyWith(color: color),maxLines: maxLines,overflow: overflow,)
        : Text(SharedHelper.getTranslatedText(textKey),
            textAlign: textAlign, style: style2.copyWith(color: color),maxLines: maxLines,overflow: overflow,);
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    Key? key,
    this.trimLines = 2,
    this.textstyle,
    this.readTextStyle,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final TextStyle? textstyle;
  final TextStyle? readTextStyle;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

//ExpandableText
class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final colorClickableText =
        AppColors.getSingleColor(AppColorsEnum.secondaryColor);
    final widgetColor = Colors.black;
    TextSpan link = TextSpan(
        text: _readMore ? AppStrings.readmore : AppStrings.readless,
        style: widget.readTextStyle,
        recognizer: TapGestureRecognizer()..onTap = _onTapLink);
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset)!;
        var textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
            style: widget.textstyle,
            //children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return Column(
          children: [
            RichText(
              softWrap: true, //TODO: Need to add key language
              overflow: TextOverflow.clip,
              text: textSpan,
            ),
            Align(
                alignment: Alignment.topRight,
                child: RichText(text: TextSpan(children: <TextSpan>[link])))
          ],
        );
      },
    );
    return result;
  }
}
