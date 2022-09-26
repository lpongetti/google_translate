import 'package:flutter/cupertino.dart';

import '../repositories/google_translate_repository.dart';

class GoogleTranslateController {
  static GoogleTranslateController? _singleton;

  final _reopsitory = GoogleTranslateReopsitory();

  @protected
  final String apiKey;
  String sourceLanguage;
  String targetLanguage;
  Duration cacheDuration;

  static GoogleTranslateController init({
    required String apiKey,
    required String sourceLanguage,
    required String targetLanguage,
    Duration cacheDuration = const Duration(days: 7),
  }) {
    return _singleton = GoogleTranslateController._internal(
      apiKey: apiKey,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      cacheDuration: cacheDuration,
    );
  }

  factory GoogleTranslateController() {
    assert(_singleton != null);
    return _singleton!;
  }

  GoogleTranslateController._internal({
    required this.apiKey,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.cacheDuration,
  });

  Future<String> translate(
    String text, {
    String? sourceLanguage,
    String? targetLanguage,
  }) {
    final source = sourceLanguage ?? this.sourceLanguage;
    final target = targetLanguage ?? this.targetLanguage;
    return _reopsitory.translate(
        text: text,
        source: source,
        target: target,
        apiKey: apiKey,
        cacheDuration: cacheDuration);
  }
}
