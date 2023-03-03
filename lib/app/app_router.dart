import 'package:advancio_test/ui/views/auth/account_created_screen.dart';
import 'package:advancio_test/ui/views/auth/login_screen.dart';
import 'package:advancio_test/ui/views/auth/register_screen.dart';
import 'package:advancio_test/ui/views/auth/pin_screen.dart';
import 'package:advancio_test/ui/views/dashboard/home_screen.dart';
import 'package:advancio_test/ui/views/dashboard/news_content_screen.dart';
import 'package:advancio_test/ui/views/dashboard/news_screen.dart';
import 'package:advancio_test/ui/views/startup/startup_screen.dart';
import 'package:advancio_test/ui/views/transfer/bank_transfer_screen.dart';
import 'package:advancio_test/ui/views/transfer/transfer_screen.dart';
import 'package:advancio_test/ui/views/transfer/transfer_succes_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String startupScreen = '/';
  static const String registerScreen = '/register-screen';
  static const String loginScreen = '/login-screen';
  static const String accountCreatedScreen = '/account-created-screen';
  static const String setupPinScreen = '/setup-pin-screen';
  static const String homeScreen = '/home-screen';
  static const String transferScreen = '/transfer-screen';
  static const String bankTransferScreen = '/bank-transfer-screen';
  static const String transferSuccessScreen = '/transfer-success-screen';
  static const String newsScreen = '/news-screen';
  static const String newsContentScreen = '/news-content-screen';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupScreen:
        return MaterialPageRoute(builder: (_) => const StartupScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.accountCreatedScreen:
        return MaterialPageRoute(builder: (_) => const AccountCreatedScreen());
      case Routes.setupPinScreen:
        return MaterialPageRoute(builder: (_) => const PinScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.transferScreen:
        return MaterialPageRoute(builder: (_) => const TransferScreen());
      case Routes.bankTransferScreen:
        return MaterialPageRoute(builder: (_) => const BankTransferScreen());
      case Routes.transferSuccessScreen:
        return MaterialPageRoute(builder: (_) => const TransferSuccessScreen());
      case Routes.newsScreen:
        return MaterialPageRoute(builder: (_) => const NewsScreen());
      case Routes.newsContentScreen:
        final data = settings.arguments! as Map<String, dynamic>;
        final image = data['image'] as String;
        final content = data['content'] as String;
        final title = data['title'] as String;
        return MaterialPageRoute(
          builder: (_) => NewsContentScreen(
            image: image,
            content: content,
            title: title,
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
