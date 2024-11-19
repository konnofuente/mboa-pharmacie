import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mboa_pharmacie/data/remote/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constant/constants.dart';
import '../local/impl/local_storage_impl.dart';
import 'api_client.dart';

class ApiClientHelper {
  static ApiClient? _apiClient;

  static LocalStorageImpl localStorageImpl = LocalStorageImpl(GetStorage());

  static create() {
    Dio _dio = Dio();

    var cacheOption = CacheOptions(
      store: HiveCacheStore(AppPathProvider.path),
      policy: CachePolicy.refreshForceCache,
      // FOR BAD CONNEXION
      hitCacheOnErrorExcept: [],
      maxStale: const Duration(days: AppConstants.cacheDays),
      //increase number of days for loger cache
      priority: CachePriority.high,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    //intercepteur pour la gestion du cache
    //EXPERIMENTATION
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: cacheOption,
      ),
    );

    // affichage des reponse des request dans le log

    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: false,
        requestHeader: false,
        logPrint: (o) => log(
          o.toString(),
        ),
      ),
    );

    //interception de toutes les request pour ajouter le token du user
    _dio.interceptors.add(
      InterceptorsWrapper(
          // onRequest: (options, handler) {
          //   if (localStorageImpl.getToken() != null) {
          //     options.headers['Authorization'] =
          //         localStorageImpl.getAuthorization();
          //     return handler.next(options);
          //   }
          //   return handler.next(options);
          // },
          // onError: (DioError e, handler) async {
          //   if (e.response?.statusCode == 401) {
          //     if (kDebugMode) {
          //       print("DIO ERROR ====>>>> ${e.error}");
          //     }
          //     EasyLoading.dismiss();
          //     return handler.next(e);
          //   }
          //
          //   if (e.response?.statusCode == 403) {
          //     LocalStorageImpl _localStorageImpl = LocalStorageImpl(GetStorage());
          //     dynamic newAccessToken =
          //         await ApiClient(Dio(), baseUrl: AppConstants.serverUrl)
          //             .refreshToken(refresh: localStorageImpl.getRefreshToken()!);
          //     if (newAccessToken != null ) {
          //       _localStorageImpl.saveToken(newAccessToken['access'].toString());
          //       e.requestOptions.headers['Authorization'] =
          //           localStorageImpl.getAuthorization();
          //     }
          //     return handler.resolve(await _dio.fetch(e.requestOptions));
          //   }
          //   EasyLoading.dismiss();
          //   return handler.next(e);
          // },
          ),
    );

    _dio.options.headers["Host"] = AppConstants.packageName;
    _dio.options.headers["Content-Type"] = "application/json;charset=UTF-8";
    _dio.options.headers["X-REQUESTED-WITH"] = "XMLHttpRequest";
    _dio.options.headers["Accept-Charset"] = "utf-8";

    _apiClient = ApiClient(_dio, baseUrl: AppConstants.serverUrl);
  }

  static ApiClient get instance {
    if (_apiClient == null) {
      create();
      return _apiClient!;
    }
    return _apiClient!;
  }

  static String getMessage(e) {
    return "Une erreur s'est produite";
  }
}
