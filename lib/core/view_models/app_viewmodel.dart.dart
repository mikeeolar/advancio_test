import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/app/app_router.dart';
import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:flutter/material.dart';

class AppViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final bvnController = TextEditingController();
  final searchStoreCtrl = TextEditingController();

  int _bottomSheetIndex = 0;
  int get bottomSheetIndex => _bottomSheetIndex;

  bool isContainsStore = false;
  String store = '';

  void setBottomSheetIndex(int value) {
    _bottomSheetIndex = value;
    rebuildUi();
  }

  /// Navigation Handlers
  Future navigateToRegisterScreen() async {
    await _navigationService.navigateTo(Routes.registerScreen);
  }

  Future navigateToLoginScreen() async {
    await _navigationService.navigateTo(Routes.loginScreen);
  }

  Future navigateCompleteLoginScreen() async {
    await _navigationService.replaceWith(Routes.loginScreen);
  }

  Future navigateToTransferScreen() async {
    await _navigationService.navigateTo(Routes.transferScreen);
  }
}
