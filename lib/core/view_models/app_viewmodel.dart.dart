import 'package:advancio_test/app/app_locator.dart';
import 'package:advancio_test/app/app_router.dart';
import 'package:advancio_test/core/base/base_view_model.dart';
import 'package:advancio_test/core/base/navigation_service.dart';
import 'package:advancio_test/core/base/server_error_model.dart';
import 'package:advancio_test/core/base/service_state.dart';
import 'package:advancio_test/core/enum/view_state.dart';
import 'package:advancio_test/core/models/news.dart';
import 'package:advancio_test/core/services/news_service.dart';
import 'package:flutter/material.dart';

class AppViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _newsService = locator<NewsService>();

  final bvnController = TextEditingController();
  final searchStoreCtrl = TextEditingController();

  int _bottomSheetIndex = 0;
  int get bottomSheetIndex => _bottomSheetIndex;

  bool isContainsStore = false;
  String store = '';

  List<Articles> _articles = [];
  List<Articles> get articles => [..._articles];

  void setBottomSheetIndex(int value) {
    _bottomSheetIndex = value;
    rebuildUi();
  }

  Future<void> onLoad() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fetchAllNews();
    });
  }

  Future<void> fetchAllNews() async {
    setState(ViewState.busy);
    try {
      ServiceState response = await _newsService.getAllNews();
      if (response is SuccessState) {
        News news = response.value;
        _articles = news.articles!;
        setState(ViewState.idle);
      } else if (response is ErrorState) {
        ServerErrorModel error = response.value;
        error.toString();
        setState(ViewState.idle);
      }
    } catch (error) {
      error.toString();
      notifyListeners();
    }
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

  Future navigateToNewsScreen() async {
    await _navigationService.navigateTo(Routes.newsScreen);
  }

  Future navigateToNewsContentScreen({image, title, content}) async {
    await _navigationService.navigateTo(Routes.newsContentScreen, arguments: {
      'image': image,
      'title': title,
      'content': content,
    });
  }
}
