import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function() delete;

  const NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // implement the number keys (from 0 to 9) with the NumberButton widget
          // the NumberButton widget is defined in the bottom of this file
          children: [
            NumberButton(
              number: 1,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 2,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 3,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 4,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 5,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 6,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 7,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 8,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 9,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EmptyWidget(
              size: buttonSize,
              color: kLightColor,
              controller: controller,
            ),
            NumberButton(
              number: 0,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            DeleteButton(
              size: buttonSize,
              color: buttonColor,
              controller: controller,
              onTap: delete,
            )
          ],
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.text += number.toString();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomText(
              text: number.toString(),
              fontWeight: FontWeight.w700,
              color: kDarkColor,
              fontSize: 22.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final double size;
  final Color color;
  final TextEditingController controller;
  final Function() onTap;

  const DeleteButton({
    Key? key,
    required this.size,
    required this.color,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.close,
              color: kDarkColor,
              size: 35,
              weight: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  final double size;
  final Color color;
  final TextEditingController controller;

  const EmptyWidget({
    Key? key,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
          side: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
        ),
        child: const SizedBox(),
      ),
    );
  }
}
