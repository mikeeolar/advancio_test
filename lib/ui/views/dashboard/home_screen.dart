import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/app_viewmodel.dart.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                HexColor('#EF3054'),
                HexColor('#360B0B').withOpacity(0.7519),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Gap(70.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomText(
                            text: 'N170,425',
                            fontSize: 35,
                            color: kLightColor,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            text: 'Available Credit',
                            fontSize: 15,
                            color: kLightColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/proflle.png',
                              height: 47,
                              width: 47,
                            ),
                            Positioned(
                              bottom: 4,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: kLightColor,
                                    width: 2,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  backgroundColor: kPrimaryColor,
                                  radius: 6,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Gap(20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(20.h),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          padding: const EdgeInsets.only(bottom: 25),
                          decoration: const BoxDecoration(
                            color: kLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Icon(
                                        Icons.circle,
                                        size: 14,
                                        color: HexColor('#6DC82A'),
                                      ),
                                    ),
                                    const Gap(20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: 'Credit Score',
                                            color: kTextColor,
                                            fontSize: 11,
                                          ),
                                          const CustomText(
                                            text: '700',
                                            color: kDarkColor,
                                            fontSize: 22,
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Remark',
                                          color: kTextColor,
                                          fontSize: 11,
                                        ),
                                        const CustomText(
                                          text: 'Excellent',
                                          color: kDarkColor,
                                          fontSize: 22,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Divider(
                                color: HexColor('#979797'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: HexColor('#F9F9FB'),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                decoration: const BoxDecoration(
                                  color: kLightColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: CustomText(
                                        text:
                                            'Here are tips on how to improve your credit score to have access to more credit.',
                                        fontSize: 13,
                                        color: kDarkColor,
                                      ),
                                    ),
                                    const Gap(15),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: CustomText(
                                        text: 'Tell me more',
                                        fontSize: 13,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w700,
                                        textDecoration:
                                            TextDecoration.underline,
                                      ),
                                    ),
                                    Gap(20.h),
                                  ],
                                ),
                              ),
                              Gap(20.h),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    const Gap(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const ActivityBoxWidget(),
                                        Gap(30.h),
                                        const VerificationWidget(),
                                        Gap(20.h),
                                        const NewsPromoWidget(),
                                        Gap(30.h),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsPromoWidget extends StatelessWidget {
  const NewsPromoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'News and promo',
          fontSize: 18,
          color: kDarkColor,
          fontWeight: FontWeight.w700,
        ),
        Gap(15.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kLightColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 30),
                blurRadius: 60,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.0791),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/character.png',
                      color: kPrimaryColor,
                      colorBlendMode: BlendMode.hue,
                    ),
                  ),
                  const Positioned(
                    top: 50,
                    right: 30,
                    child: CustomText(
                      text: 'Get \$12 free!',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kLightColor,
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Share Invite your friends!',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: kDarkColor,
                    ),
                    const Gap(10),
                    const CustomText(
                      text:
                          'Invite friends register on our app. For every user you invite. you can earn up \$12',
                      fontSize: 13,
                      color: kDarkColor,
                    ),
                    Gap(10.h),
                    const CustomText(
                      text: 'Invite Now',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: kPrimaryColor,
                    ),
                    const Gap(20),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VerificationWidget extends StatelessWidget {
  const VerificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Complete Verification',
          fontSize: 18,
          color: kDarkColor,
          fontWeight: FontWeight.w700,
        ),
        Gap(10.h),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kLightColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 30),
                blurRadius: 60,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.0791),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                    text: '75%',
                    fontSize: 25,
                    color: kDarkColor,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    text: '7 of 10 completed',
                    fontSize: 12,
                    color: kDarkColor,
                  ),
                ],
              ),
              const Gap(10),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: LinearProgressIndicator(
                  value: 0.75,
                  valueColor: AlwaysStoppedAnimation(HexColor('#F5CB1A')),
                  backgroundColor: HexColor('#1C193933').withOpacity(0.2),
                  minHeight: 10,
                ),
              ),
              Gap(15.h),
              Divider(
                color: HexColor('#D2D1D7'),
              ),
              Gap(15.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    color: kPrimaryColor,
                  ),
                  const Gap(18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Personal Information',
                          fontSize: 14,
                          color: kDarkColor,
                          fontWeight: FontWeight.w700,
                        ),
                        const Gap(10),
                        const CustomText(
                          text:
                              'When you register for an account, we collectt personal informmation',
                          fontSize: 13,
                          color: kDarkColor,
                        ),
                        const Gap(10),
                        CustomText(
                          text: 'Continue',
                          fontSize: 13,
                          color: HexColor('#7165E3'),
                          fontWeight: FontWeight.w700,
                        ),
                        Gap(10.h),
                        Divider(
                          color: HexColor('#D2D1D7'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Gap(10.h),
              Row(
                children: [
                  Image.asset('assets/images/identity_card.png',
                      color: kPrimaryColor),
                  const Gap(18),
                  const CustomText(
                    text: 'Verification',
                    fontSize: 14,
                    color: kDarkColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Gap(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 37),
                child: Divider(
                  color: HexColor('#D2D1D7'),
                ),
              ),
              Gap(10.h),
              Row(
                children: [
                  Image.asset(
                    'assets/images/email.png',
                    color: kPrimaryColor,
                  ),
                  const Gap(18),
                  const CustomText(
                    text: 'Confirm email',
                    fontSize: 14,
                    color: kDarkColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ActivityBoxWidget extends StatelessWidget {
  const ActivityBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Activity',
            fontSize: 18,
            color: kDarkColor,
            fontWeight: FontWeight.w700,
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  model.navigateToTransferScreen();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: 107,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kLightColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 30),
                        blurRadius: 60,
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.0791),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset('assets/svgs/transfer.svg'),
                        ),
                      ),
                      const Gap(20),
                      const CustomText(
                        text: 'Transfer',
                        fontSize: 13,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 107,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 30),
                      blurRadius: 60,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.0791),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('#FFBF1E'),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          'assets/images/credit_card.png',
                          height: 13,
                        ),
                      ),
                    ),
                    const Gap(20),
                    const CustomText(
                      text: 'My Card',
                      fontSize: 13,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 107,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 30),
                            blurRadius: 60,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.0791),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          'assets/images/growth.png',
                          height: 14,
                        ),
                      ),
                    ),
                    const Gap(20),
                    const CustomText(
                      text: 'Pay Loan',
                      fontSize: 13,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
