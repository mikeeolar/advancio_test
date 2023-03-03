import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/core/services/authentication_service.dart';
import 'package:advancio_test/core/services/news_service.dart';
import 'package:advancio_test/core/view_models/account_viewmodel.dart';
import 'package:advancio_test/core/view_models/app_viewmodel.dart.dart';
import 'package:advancio_test/core/view_models/authentication_viewmodel.dart';
import 'package:advancio_test/core/view_models/transfer_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

/// Dependency Injection
/// Register Services and Viewmodels

void setUpLocator() {
  locator.registerLazySingleton(() => NavigationService());

  // API Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NewsService());

  // View Models
  locator.registerSingleton(AuthenticationViewModel());
  locator.registerSingleton(AppViewModel());
  locator.registerSingleton(AccountViewModel());
  locator.registerSingleton(TransferViewModel());
}
