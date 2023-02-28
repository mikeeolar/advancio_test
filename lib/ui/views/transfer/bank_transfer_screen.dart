import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/transfer_viewmodel.dart';
import 'package:advancio_test/ui/bottom_sheets/select_account_bottomsheet.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/common/ui_config.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/input_field.dart';
import 'package:advancio_test/ui/widgets/num_pad.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TransferViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            if (model.currentIndex == 0) const TransferDetailsWidget(),
            if (model.currentIndex == 1) const TranferPinWidget(),
          ],
        ),
      ),
    );
  }
}

class TransferDetailsWidget extends StatelessWidget {
  const TransferDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<TransferViewModel>(
      builder: (context, model, child) => Expanded(
        child: Column(
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
                                color: HexColor('#8F001B')),
                            child: Image.asset(
                              'assets/images/user.png',
                              color: kLightColor,
                            ),
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
                          Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19.r),
                              color: kLightColor,
                            ),
                            child: Image.asset(
                              'assets/images/bank.png',
                              color: HexColor('#E41613'),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          CustomText(
                            text: 'Enter transfer details',
                            fontSize: 16.sp,
                            color: kDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              UiConfig.showBottomSheet(
                                context,
                                const SelectAccountBottomSheet(),
                              );
                            },
                            child: InputField(
                              controller: model.bvnController,
                              isLastField: false,
                              enabled: false,
                              filledColor: HexColor('#F7F7F7'),
                              borderColor: HexColor('#F7F7F7'),
                              suffixIcon: Icon(
                                Icons.expand_more,
                                color: HexColor('#979797'),
                              ),
                              hintText: 'Select Account',
                            ),
                          ),
                          Gap(25.h),
                          InputField(
                            controller: model.bvnController,
                            isLastField: false,
                            filledColor: HexColor('#F7F7F7'),
                            borderColor: HexColor('#F7F7F7'),
                            hintText: 'Enter Amount',
                          ),
                          Gap(25.h),
                          InputField(
                            controller: model.bvnController,
                            isLastField: false,
                            filledColor: HexColor('#F7F7F7'),
                            borderColor: HexColor('#F7F7F7'),
                            hintText: 'Enter Recipient Account No.',
                          ),
                          Gap(25.h),
                          InputField(
                            controller: model.bvnController,
                            isLastField: false,
                            filledColor: HexColor('#F7F7F7'),
                            borderColor: HexColor('#F7F7F7'),
                            hintText: 'Select Recipient Bank',
                            suffixIcon: Icon(
                              Icons.expand_more,
                              color: HexColor('#979797'),
                            ),
                          ),
                          Gap(25.h),
                          InputField(
                            controller: model.bvnController,
                            isLastField: false,
                            filledColor: HexColor('#F7F7F7'),
                            borderColor: HexColor('#F7F7F7'),
                            hintText: 'Narration',
                          ),
                          Gap(35.h),
                          PrimaryButton(
                            onTap: () {
                              model.setIndex(1);
                            },
                            btnText: 'Proceed',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TranferPinWidget extends StatelessWidget {
  const TranferPinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TransferViewModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => true,
        child: Expanded(
          child: Column(
            children: [
              const Gap(90),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      model.setIndex(0);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: kDarkColor,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Enter your PIN',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: kDarkColor,
                        ),
                        Gap(5.h),
                        CustomText(
                          text: 'Confirm transfer of N100.00',
                          fontSize: 15,
                          color: kTextColor,
                        ),
                        Gap(30.h),
                        PasscodeTextFieldWidget(
                          controller: model.pinCtrl,
                          onCompleted: (v) {
                            if (v.length == 6) {
                              model.setIndex(1);
                            }
                          },
                        ),
                        const Gap(20),
                        NumPad(
                          delete: () {
                            if (model.pinCtrl.text.isEmpty) {
                            } else {
                              model.pinCtrl.text = model.pinCtrl.text
                                  .substring(0, model.pinCtrl.text.length - 1);
                            }
                          },
                          controller: model.pinCtrl,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  bottom: 50.h,
                ),
                child: PrimaryButton(
                  onTap: () {
                    model.navigateToTransferSuccessScreen();
                  },
                  btnText: 'Confirm',
                  btnFontSize: 17,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasscodeTextFieldWidget extends StatelessWidget {
  const PasscodeTextFieldWidget({
    super.key,
    required this.controller,
    this.onCompleted,
  });

  final ValueChanged<String>? onCompleted;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: PinCodeTextField(
        enableActiveFill: true,
        appContext: context,
        animationType: AnimationType.none,
        length: 4,
        onChanged: (value) {},
        controller: controller,
        obscureText: true,
        obscuringWidget: Image.asset(
          'assets/images/asterics.png',
          height: 20,
        ),
        autoDisposeControllers: false,
        onCompleted: onCompleted,
        boxShadows: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 24,
            spreadRadius: 1,
            color: HexColor('#5D648A').withOpacity(0.1),
          )
        ],
        pinTheme: PinTheme(
          selectedColor: kLightColor,
          inactiveFillColor: kLightColor,
          inactiveColor: kLightColor,
          shape: PinCodeFieldShape.box,
          activeColor: kLightColor,
          borderRadius: BorderRadius.circular(16),
          borderWidth: 0,
          selectedFillColor: kLightColor,
          fieldHeight: 52,
          fieldWidth: 52,
          activeFillColor: kLightColor,
        ),
      ),
    );
  }
}
