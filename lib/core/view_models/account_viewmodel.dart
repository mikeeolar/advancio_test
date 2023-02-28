import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends BaseViewModel {
  // final _navigationService = locator<NavigationService>();

  final bvnController = TextEditingController();

  int _bottomSheetIndex = 0;
  int get bottomSheetIndex => _bottomSheetIndex;

  void setBottomSheetIndex(int value) {
    _bottomSheetIndex = value;
    rebuildUi();
  }

  /// Navigation Handlers
}
