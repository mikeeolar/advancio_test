import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/app/app_router.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/core/base/session_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'core/base/dismiss_keyboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await SessionService.initializeSharedPreferences();
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return DismissKeyboard(
          child: MaterialApp(
            title: 'Advancio',
            theme: ThemeData(
              primarySwatch: Colors.red,
              useMaterial3: true,
              colorScheme: ColorScheme.light(
                background: HexColor('#FFFFFE'),
              ),
            ),
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: Routes.startupScreen,
          ),
        );
      },
    );
  }
}
