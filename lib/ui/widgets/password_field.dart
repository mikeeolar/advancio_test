import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
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
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      enabled: widget.enabled,
      style: const TextStyle(
        fontSize: 16,
        color: kDarkColor,
        fontWeight: FontWeight.w500,
      ),
      controller: widget.controller,
      inputFormatters: widget.formatter,
      maxLength: widget.maxLength,
      textInputAction:
          widget.isLastField ? TextInputAction.done : TextInputAction.next,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        errorText: widget.errorText,
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        filled: widget.isFocused,
        fillColor: widget.filledColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _toggle,
              child: _obscureText
                  ? Icon(
                      Icons.visibility_off,
                      color: HexColor('#CECECE'),
                    )
                  : Icon(
                      Icons.visibility,
                      color: HexColor('#CECECE'),
                    ),
            ),
          ],
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kInputFieldColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kInputFieldColor,
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
            color: HexColor('#BDBDBD'),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
