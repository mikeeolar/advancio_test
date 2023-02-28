import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/base/session_services.dart';
import 'package:advancio_test/core/enum/view_state.dart';
import 'package:advancio_test/core/view_models/authentication_viewmodel.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/num_pad.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Gap(50),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomText(
                            text: 'Set your PIN',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: kDarkColor,
                          ),
                          Gap(5.h),
                          CustomText(
                            text: 'You will use this to login next time',
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
                                    .substring(
                                        0, model.pinCtrl.text.length - 1);
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
                  child: model.state == ViewState.busy
                      ? const Center(
                          child:
                              CircularProgressIndicator(color: kPrimaryColor),
                        )
                      : PrimaryButton(
                          onTap: () {
                            model.setPin(
                              id: SessionService.getUserId,
                              pin: model.pinCtrl.text,
                            );
                          },
                          btnText: 'Save PIN',
                          btnFontSize: 17,
                        ),
                )
              ],
            ),
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
            color: HexColor('#5D648A').withOpacity(0.3),
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
