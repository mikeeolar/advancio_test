import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/authentication_viewmodel.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(40),
                    Image.asset(
                      'assets/images/thumbs_up.png',
                      height: 200,
                    ),
                    Gap(70.h),
                    const CustomText(
                      text: 'Account Created!',
                      fontSize: 35,
                      color: kDarkColor,
                      fontWeight: FontWeight.w700,
                    ),
                    Gap(10.h),
                    CustomText(
                      text:
                          'Dear user your account has been created successfully. Continue to start using app',
                      fontSize: 15,
                      color: kTextColor,
                      textAlign: 1,
                    ),
                    Gap(MediaQuery.of(context).size.height * 0.2),
                    PrimaryButton(
                      onTap: () {
                        model.navigateToSetupPincreen();
                      },
                      btnText: 'Continue',
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
