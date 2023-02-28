import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/app/app_router.dart';
import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:flutter/material.dart';

class TransferViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final bvnController = TextEditingController();
  final searchStoreCtrl = TextEditingController();
  final pinCtrl = TextEditingController();

  int _bottomSheetIndex = 0;
  int get bottomSheetIndex => _bottomSheetIndex;

  bool isContainsStore = false;
  String store = '';

  void setBottomSheetIndex(int value) {
    _bottomSheetIndex = value;
    rebuildUi();
  }

  /// Navigation Handlers
  Future navigateToTransferScreen() async {
    await _navigationService.navigateTo(Routes.transferScreen);
  }

  Future navigateToBankTransferScreen() async {
    await _navigationService.navigateTo(Routes.bankTransferScreen);
  }

  Future navigateToTransferSuccessScreen() async {
    await _navigationService.navigateTo(Routes.transferSuccessScreen);
  }

  Future navigateToHomeScreen() async {
    await _navigationService.replaceWith(Routes.homeScreen);
  }
}
