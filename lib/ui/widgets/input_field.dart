import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.inputType,
      required this.isLastField,
      this.errorText,
      this.formatter,
      this.enabled = true,
      this.maxLines,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.maxLength,
      this.onTap,
      this.borderColor,
      this.borderWidth = 0,
      this.filledColor = kInputFieldColor,
      this.isFocused = true})
      : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? inputType;
  final bool isLastField;
  final bool enabled;
  final int? maxLines;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatter;
  final String? errorText;
  final Widget? suffixIcon;
  final int? maxLength;
  final Color? borderColor;
  final double borderWidth;
  final Function()? onTap;
  final Color? filledColor;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      enabled: enabled,
      style: const TextStyle(
        fontSize: 16,
        color: kDarkColor,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      inputFormatters: formatter,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction:
          isLastField ? TextInputAction.done : TextInputAction.next,
      keyboardType: inputType,
      decoration: InputDecoration(
        errorText: errorText,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        filled: isFocused,
        fillColor: filledColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? kInputFieldColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? kInputFieldColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? kInputFieldColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor('#BDBDBD'),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.inputType,
      required this.isLastField,
      this.errorText,
      this.formatter,
      this.enabled = true,
      this.maxLines,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.maxLength,
      this.onTap,
      this.borderColor = const Color(0xFFECECEC),
      this.borderWidth = 0,
      this.filledColor = kInputFieldColor,
      this.isFocused = true})
      : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? inputType;
  final bool isLastField;
  final bool enabled;
  final int? maxLines;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatter;
  final String? errorText;
  final Widget? suffixIcon;
  final int? maxLength;
  final Color borderColor;
  final double borderWidth;
  final Function()? onTap;
  final Color? filledColor;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      enabled: enabled,
      style: const TextStyle(
        fontSize: 16,
        color: kDarkColor,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      inputFormatters: formatter,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction:
          isLastField ? TextInputAction.done : TextInputAction.next,
      keyboardType: inputType,
      decoration: InputDecoration(
        errorText: errorText,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        filled: isFocused,
        fillColor: filledColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kInputFieldColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor('#F9F9FB'),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kInputFieldColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor('#F9F9FB'),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: HexColor('#9EA6BE'),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
