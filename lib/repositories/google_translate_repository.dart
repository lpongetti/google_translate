import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class GoogleTranslateReopsitory {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://translation.googleapis.com/",
  ));
  final completer = Completer();

  GoogleTranslateReopsitory({
    required Duration cacheDuration,
  }) {
    getTemporaryDirectory().then((cache) {
      _dio.interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: HiveCacheStore(
              cache.path,
              hiveBoxName: "google_translate_cache",
            ),
            maxStale: cacheDuration,
            policy: CachePolicy.forceCache,
            priority: CachePriority.high,
            hitCacheOnErrorExcept: [401, 404],
            allowPostMethod: false,
          ),
        ),
      );
      completer.complete();
    });
  }

  Future<String> translate({
    required String text,
    String? source,
    required String target,
    required String apiKey,
  }) async {
    await completer.future;

    try {
      Response response = await _dio.get(
        "language/translate/v2",
        queryParameters: {
          "key": apiKey,
          "q": text,
          "source": source,
          "target": target,
          "format": "text",
        },
      );

      if ((response.statusCode == 200 || response.statusCode == 304) &&
          response.data?["data"]?["translations"] != null &&
          response.data["data"]?["translations"]?.length > 0) {
        text = response.data["data"]?["translations"].first["translatedText"];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return text;
  }
}
