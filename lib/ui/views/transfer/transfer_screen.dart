import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/transfer_viewmodel.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/input_field.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TransferViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: HexColor('#F9F9FB'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    HexColor('#EF3054'),
                    HexColor('#360B0B').withOpacity(0.7591),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(60.h),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        color: kLightColor,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: CustomText(
                            text: 'Transfer',
                            color: kLightColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19.r),
                                color: kLightColor),
                            child: Image.asset('assets/images/user.png'),
                          ),
                          const Gap(8),
                          const CustomText(
                            text: 'Mobile',
                            fontSize: 12,
                            color: kLightColor,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              model.navigateToBankTransferScreen();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(19.r),
                                color: HexColor('#8F001B'),
                              ),
                              child: Image.asset('assets/images/bank.png'),
                            ),
                          ),
                          const Gap(8),
                          const CustomText(
                            text: 'Bank',
                            fontSize: 12,
                            color: kLightColor,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              color: HexColor('#8F001B'),
                            ),
                            child: Image.asset('assets/images/online.png'),
                          ),
                          const Gap(8),
                          const CustomText(
                            text: 'Online',
                            fontSize: 12,
                            color: kLightColor,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              color: HexColor('#8F001B'),
                            ),
                            child: Image.asset('assets/images/qr_code.png'),
                          ),
                          const Gap(8),
                          const CustomText(
                            text: 'QR code',
                            fontSize: 12,
                            color: kLightColor,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(color: HexColor('#F9F9FB')),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          CustomText(
                            text: 'Recent',
                            fontSize: 16.sp,
                            color: kDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: kLightColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/p1.png',
                                        height: 100,
                                      ),
                                      const CustomText(
                                        text: 'Hailey',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: kDarkColor,
                                      ),
                                      CustomText(
                                        text: '+090078601',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#9EA6BE'),
                                      )
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: kLightColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/p2.png',
                                        height: 100,
                                      ),
                                      const CustomText(
                                        text: 'Zayn',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: kDarkColor,
                                      ),
                                      CustomText(
                                        text: '+090078601',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#9EA6BE'),
                                      )
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: kLightColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/p3.png',
                                        height: 100,
                                      ),
                                      const CustomText(
                                        text: 'Thomson',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: kDarkColor,
                                      ),
                                      CustomText(
                                        text: '+090078601',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: HexColor('#9EA6BE'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(20.h),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: const BoxDecoration(color: kLightColor),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          CustomText(
                            text: 'All contacts',
                            fontSize: 16.sp,
                            color: kDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          SearchField(
                            controller: model.bvnController,
                            isLastField: true,
                            filledColor: HexColor('#F9F9FB'),
                            borderColor: HexColor('#F9F9FB'),
                            hintText: 'search name or number..',
                            prefixIcon: Icon(
                              Icons.search,
                              color: HexColor('#8F96AD'),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image.asset(
                                  'assets/images/p1.png',
                                  height: 74.h,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomText(
                                      text: 'Hailey Sanders',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kDarkColor,
                                    ),
                                    CustomText(
                                      text: '+090078601',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('#9EA6BE'),
                                    )
                                  ],
                                ),
                              ),
                              PrimaryButton(
                                onTap: () {},
                                borderRadius: 5,
                                height: 35,
                                btnText: 'Invite',
                                width: 80,
                                color: HexColor(
                                  '#9EA6BE',
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: HexColor('#D2D1D7'),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image.asset(
                                  'assets/images/p2.png',
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomText(
                                      text: 'Zayn Michel',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kDarkColor,
                                    ),
                                    CustomText(
                                      text: '+090078601',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('#9EA6BE'),
                                    )
                                  ],
                                ),
                              ),
                              PrimaryButton(
                                onTap: () {},
                                borderRadius: 5,
                                height: 35,
                                btnText: 'Invite',
                                width: 80,
                                color: HexColor(
                                  '#9EA6BE',
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: HexColor('#D2D1D7'),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  'assets/images/p3.png',
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomText(
                                      text: 'Hailey Sanders',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: kDarkColor,
                                    ),
                                    CustomText(
                                      text: '+090078601',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('#9EA6BE'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
