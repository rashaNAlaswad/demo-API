import 'package:dio/dio.dart';

import '../../services/service_locator.dart';
import '../cache/cache_helper.dart';
import 'end_points.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
        sl<CacheHelper>().getData(key: ApiKeys.token) != null
            ? 'FOODAPI ${sl<CacheHelper>().getData(key: ApiKeys.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
