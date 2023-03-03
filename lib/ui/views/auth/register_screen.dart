import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/enum/view_state.dart';
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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                      text: 'Welcome!',
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
                      controller: model.fullNameCtrl,
                      isLastField: false,
                      inputType: TextInputType.name,
                      hintText: 'Full Name',
                      isFocused: model.isfullNameInputFocused,
                      onTap: () {
                        model.changeFullNameFocused();
                      },
                    ),
                    const Gap(8),
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
                    const Gap(25),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.7,
                          child: Checkbox(
                            value: model.isAgree,
                            activeColor: kPrimaryColor,
                            onChanged: model.changeTermsCodition,
                            side: BorderSide(
                              color: HexColor('#979797'),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: CustomText(
                            text:
                                'By creating your account you have to agree with our Teams and Conditions.',
                          ),
                        )
                      ],
                    ),
                    Gap(40.h),
                    model.state == ViewState.busy
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ))
                        : PrimaryButton(
                            onTap: () {
                              model.register(
                                fullName: model.fullNameCtrl.text,
                                email: model.emailCtrl.text,
                                password: model.passwordCtrl.text,
                                context: context,
                              );
                            },
                            btnText: 'Sign up My Account',
                            height: 60,
                          ),
                    Gap(10.h),
                    TextButton(
                      onPressed: () {
                        model.navigateToLoginScreen();
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Already have an account? - ',
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: HexColor('#828282'),
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
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
