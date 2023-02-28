import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/view_models/app_viewmodel.dart.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/ss_image.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 220,
              left: 90,
              right: 90,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 17),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: SvgPicture.asset('assets/svgs/lendn.svg'),
              ),
            ),
            Positioned(
              bottom: -10,
              right: 0,
              left: 0,
              child: Image.asset(
                'assets/images/mask.png',
                // height: 300,
                width: 450,
              ),
            ),
            Positioned(
                bottom: 125,
                right: 90,
                left: 90,
                child: InkWell(
                  onTap: () {
                    model.navigateCompleteLoginScreen();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: kLightColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kDarkColor,
                          ),
                        ),
                        const CircleAvatar(
                          radius: 17,
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
