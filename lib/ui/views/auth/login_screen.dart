import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/authentication_viewmodel.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/input_field.dart';
import 'package:advancio_test/ui/widgets/password_field.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      onModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.isEmailInputFocused = true;
          model.isPasswordInputFocused = true;
        });
      },
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25),
                child: Column(
                  children: [
                    const Gap(30),
                    CustomText(
                      text: 'Welcome Back!',
                      fontSize: 33.sp,
                      fontWeight: FontWeight.w700,
                      color: kDarkColor,
                    ),
                    Gap(20.h),
                    CustomText(
                      text: 'Sign in to continue ',
                      fontSize: 15,
                      color: kTextColor,
                    ),
                    Gap(80.h),
                    InputField(
                      controller: model.emailCtrl,
                      isLastField: false,
                      inputType: TextInputType.emailAddress,
                      hintText: 'Email',
                      isFocused: model.isEmailInputFocused,
                      onTap: () {
                        model.changeEmailFocused();
                      },
                    ),
                    const Gap(8),
                    PasswordField(
                      controller: model.passwordCtrl,
                      isLastField: false,
                      inputType: TextInputType.name,
                      hintText: 'Password',
                      isFocused: model.isPasswordInputFocused,
                      onTap: () {
                        model.changePasswordFocused();
                      },
                    ),
                    const Gap(15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const CustomText(
                          text: 'Forgot Password?',
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Gap(40.h),
                    PrimaryButton(
                      onTap: () {
                        model.navigateToHomeScreen();
                      },
                      btnText: 'Sign in My Account',
                      height: 60,
                    ),
                    Gap(10.h),
                    TextButton(
                      onPressed: () {
                        model.navigateToRegistrationScreen();
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Don’t have an account? - ',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: HexColor('#828282'),
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                color: kTextColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
