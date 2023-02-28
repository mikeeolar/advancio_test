import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:advancio_test/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class UiConfig {
  static final _navigationService = locator<NavigationService>();

  /// [Bottomsheet] Panel
  static showBottomSheet(context, child) async {
    FocusManager.instance.primaryFocus?.unfocus();
    showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) => child,
    );
  }

  static showResponseDialog(
      {context, title, message, icon, iconBgColor}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigationService.goBack();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.close,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: iconBgColor ?? Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      icon ?? Icons.close,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title ?? 'Oops! something went wrong',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: message ?? 'Sorry, an error occured',
                  textAlign: 1,
                  fontSize: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// [Biometric] Dialog Panel
  static showBiometricDialog({context, onTap}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/svgs/fingerprint.svg'),
                const Gap(15),
                const CustomText(
                  text: 'Biometric Login',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kDarkColor,
                ),
                const Gap(10),
                CustomText(
                  text:
                      'Would you like to set up your fingerprint as an option to login?',
                  fontSize: 16,
                  textAlign: 1,
                  color: kTextColor,
                ),
                const Gap(
                  30,
                ),
                PrimaryButton(onTap: onTap, btnText: 'Yes, enable'),
                const Gap(10),
                TextButton(
                  onPressed: () {
                    _navigationService.goBack();
                  },
                  child: const CustomText(
                    text: 'Not now',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// [Account] Dialog panel
  static showAlertDialog({context, icon, btnText, onTap, title, message}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const Gap(15),
                CustomText(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kDarkColor,
                ),
                const Gap(10),
                CustomText(
                  text: message,
                  fontSize: 16,
                  textAlign: 1,
                  color: kTextColor,
                ),
                const Gap(
                  30,
                ),
                PrimaryButton(onTap: onTap, btnText: btnText),
                const Gap(10),
              ],
            ),
          ),
        );
      },
    );
  }
}
