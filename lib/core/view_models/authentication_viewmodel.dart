import 'dart:developer';

import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/app/app_router.dart';
import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/core/base/session_services.dart';
import 'package:advancio_test/core/enum/view_state.dart';
import 'package:advancio_test/core/services/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final pinCtrl = TextEditingController();

  int _bottomSheetIndex = 0;
  int get bottomSheetIndex => _bottomSheetIndex;

  bool isfullNameInputFocused = true;
  bool isEmailInputFocused = true;
  bool isPasswordInputFocused = true;
  bool isAgree = false;

  void changeTermsCodition(val) {
    isAgree = val;
    rebuildUi();
  }

  void changeFullNameFocused() {
    isfullNameInputFocused = false;
    isEmailInputFocused = true;
    isPasswordInputFocused = true;
    rebuildUi();
  }

  void changeEmailFocused() {
    isEmailInputFocused = false;
    isPasswordInputFocused = true;
    isfullNameInputFocused = true;
    rebuildUi();
  }

  void changePasswordFocused() {
    isEmailInputFocused = true;
    isPasswordInputFocused = false;
    isfullNameInputFocused = true;
    rebuildUi();
  }

  void setBottomSheetIndex(int value) {
    _bottomSheetIndex = value;
    rebuildUi();
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    setState(ViewState.busy);
    try {
      final id = await _authenticationService.register(
          fullName: fullName, email: email, password: password);
      if (id > 0) {
        SessionService.setUserId(userId: id);
        navigateToAccountCreatedcreen();
        setState(ViewState.idle);
      } else {
        setState(ViewState.idle);
      }
    } catch (error) {
      log('$error');
      setState(ViewState.idle);
    }
  }

  Future<void> setPin({
    required int id,
    required String pin,
  }) async {
    setState(ViewState.busy);
    try {
      final result = await _authenticationService.setPin(
        id: id,
        pin: pin,
      );
      if (result > 0) {
        SessionService.setUserId(userId: id);
        navigateToHomeScreen();
        setState(ViewState.idle);
      } else {
        setState(ViewState.idle);
      }
    } catch (error) {
      log('$error');
      setState(ViewState.idle);
    }
  }

  /// Navigation Handlers

  Future navigateToRegistrationScreen() async {
    await _navigationService.navigateTo(Routes.registerScreen);
  }

  Future navigateToLoginScreen() async {
    await _navigationService.navigateTo(Routes.loginScreen);
  }

  Future navigateToAccountCreatedcreen() async {
    await _navigationService.navigateTo(Routes.accountCreatedScreen);
  }

  Future navigateToHomeScreen() async {
    await _navigationService.replaceWith(Routes.homeScreen);
  }

  Future navigateToSetupPincreen() async {
    await _navigationService.navigateTo(Routes.setupPinScreen);
  }
}
