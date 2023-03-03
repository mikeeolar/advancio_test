import 'package:advancio_test/app/app_constants.dart';

class _News {
  final String allNews = AppConstants.kBaseUrl +
      'v2/top-headlines?sources=techcrunch&apiKey=${AppConstants.kBaseAPIKEY}';
}

final news = _News();
