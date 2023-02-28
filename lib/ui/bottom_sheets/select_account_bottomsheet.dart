import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/app_viewmodel.dart.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class SelectAccountBottomSheet extends StatelessWidget {
  const SelectAccountBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      builder: (context, model, child) => Container(
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: CustomText(
                    text: 'Select Account',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                  ),
                ),
                Gap(35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CustomText(
                      text: '02334457689',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: '-',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: 'N1,000.00',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                  ],
                ),
                Gap(20.h),
                Divider(
                  color: HexColor('#EAEAEA'),
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CustomText(
                      text: '02334457689',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: '-',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: 'N50,000.00',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                  ],
                ),
                Gap(20.h),
                Divider(
                  color: HexColor('#EAEAEA'),
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CustomText(
                      text: '02334457689',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: '-',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    CustomText(
                      text: 'N10,000.00',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                  ],
                ),
                Gap(20.h),
                Divider(
                  color: HexColor('#EAEAEA'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
