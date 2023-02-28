import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    this.lineHeight,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w400,
    required this.text,
    this.color = kDarkColor,
    this.textAlign = 0,
    this.overflow = TextOverflow.visible,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int textAlign;
  final TextOverflow overflow;
  final double? lineHeight;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Text(
      text,
      textAlign: textAlign == 1
          ? TextAlign.center
          : textAlign == 2
              ? TextAlign.justify
              : TextAlign.start,
      overflow: overflow,
      style: GoogleFonts.dmSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: lineHeight,
        decoration: textDecoration,
      ),
    );
  }
}
