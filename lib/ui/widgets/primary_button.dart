import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.height = 55,
    this.width = double.infinity,
    required this.onTap,
    this.borderRadius = 10,
    this.color,
    this.btnFontWeight = FontWeight.w700,
    required this.btnText,
    this.btnFontColor = kLightColor,
    this.btnFontSize = 17,
  }) : super(key: key);

  final double height;
  final double width;
  final Function()? onTap;
  final double borderRadius;
  final Color? color;
  final String btnText;
  final Color? btnFontColor;
  final double? btnFontSize;
  final FontWeight? btnFontWeight;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        color: color ?? kPrimaryColor,
        disabledColor: kPrimaryColor50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
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
