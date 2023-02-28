import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/core/enum/view_state.dart';
import 'package:flutter/material.dart';

/// Contains ViewModel functionality to listen to app state changes and rebuild app ui
class BaseViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  bool _disposed = false;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  /// Calls the builder function with this updated viewmodel
  void rebuildUi() {
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  /// Change state of the app to either busy or idle
  void setState(ViewState viewState) {
    FocusManager.instance.primaryFocus?.unfocus();
    _state = viewState;
    rebuildUi();
  }

  /// Dynamically load different views on a single screen
  void setIndex(int value) {
    _currentIndex = value;
    rebuildUi();
  }

  /// Navigate any given screen back
  void popScreen() {
    _navigationService.goBack();
  }

  /// Navigate to the default homescreen
}
