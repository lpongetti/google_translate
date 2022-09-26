import 'package:flutter/cupertino.dart';

import '../repositories/google_translate_repository.dart';

class GoogleTranslateController {
  static GoogleTranslateController? _singleton;

  final _reopsitory = GoogleTranslateReopsitory();

  // apiKey: google cloud console api key
  @protected
  final String apiKey;
  // sourceLanguage: language of you text to translate
  String sourceLanguage;
  // targetLanguage: language of your translated text
  String targetLanguage;
  // cacheDuration: duration of cache api
  Duration cacheDuration;

  // Initialize GoogleTranslateController singleton
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

  // Get GoogleTranslateController already initialized
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

  // Translate your text from source to target language
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
