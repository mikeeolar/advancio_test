import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOulinedButton extends StatelessWidget {
  const PrimaryOulinedButton({
    Key? key,
    this.height = 55,
    this.width = double.infinity,
    required this.onTap,
    this.borderRadius = 10,
    this.color,
    this.btnFontWeight = FontWeight.w700,
    required this.btnText,
    this.btnFontColor = kLightColor,
    this.btnFontSize = 15,
    this.borderColor = kLightColor,
  }) : super(key: key);

  final double height;
  final double width;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? color;
  final String btnText;
  final Color? btnFontColor;
  final double? btnFontSize;
  final FontWeight? btnFontWeight;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          elevation: 0,
          side: BorderSide(
            color: borderColor!,
            width: 1.5,
          ),
        ),
        onPressed: onTap,
        child: CustomText(
          text: btnText,
          fontSize: btnFontSize!,
          fontWeight: btnFontWeight!,
          color: btnFontColor,
        ),
      ),
    );
  }
}
