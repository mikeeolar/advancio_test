import 'package:advancio_test/core/base/endpoints.dart';
import 'package:advancio_test/core/helpers/http_helper.dart';
import 'package:advancio_test/core/models/news.dart';

import '../base/service_state.dart';
import '../base/simplify_api_consuming.dart';

class NewsService {
  HttpHelper httpClient = HttpHelper();

  Future<ServiceState> getAllNews() async {
    String url = news.allNews;
    return SimplifyApiConsuming.simplifyEndpointConsumingReturn(
      () => httpClient.get(
        url,
      ),
      successResponse: (data) {
        return SuccessState<News>(News.fromJson(data));
      },
    );
  }
}
