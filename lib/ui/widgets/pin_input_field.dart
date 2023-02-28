import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinInputField extends StatelessWidget {
  const PinInputField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      enableActiveFill: true,
      length: 6,
      obscureText: false,
      cursorColor: HexColor('#622A59'),
      animationType: AnimationType.fade,
      textStyle: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
      pinTheme: PinTheme(
        inactiveFillColor: kInputFieldColor,
        inactiveColor: kInputFieldColor,
        shape: PinCodeFieldShape.box,
        selectedFillColor: kInputFieldColor,
        activeColor: HexColor('#0B711B'),
        fieldHeight: 44.h,
        fieldWidth: 45.w,
        borderRadius: BorderRadius.circular(3.r),
        activeFillColor: kInputFieldColor,
      ),
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 300),
      autoDisposeControllers: false,
      controller: controller,
      onCompleted: (v) async {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
