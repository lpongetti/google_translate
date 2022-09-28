import 'package:flutter/cupertino.dart';

import '../repositories/google_translate_repository.dart';

class GoogleTranslate {
  static GoogleTranslate? _singleton;

  final GoogleTranslateReopsitory _reopsitory;

  // apiKey: google cloud console api key
  @protected
  final String apiKey;
  // sourceLanguage: language of you text to translate
  String? sourceLanguage;
  // targetLanguage: language of your translated text
  String targetLanguage;

  // Initialize GoogleTranslateController singleton
  static GoogleTranslate initialize({
    required String apiKey,
    String? sourceLanguage,
    required String targetLanguage,
    Duration cacheDuration = const Duration(days: 7),
  }) {
    return _singleton = GoogleTranslate._internal(
        apiKey: apiKey,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        cacheDuration: cacheDuration);
  }

  // Get GoogleTranslateController already initialized
  factory GoogleTranslate() {
    assert(_singleton != null);
    return _singleton!;
  }

  GoogleTranslate._internal({
    required this.apiKey,
    required this.sourceLanguage,
    required this.targetLanguage,
    required Duration cacheDuration,
  }) : _reopsitory = GoogleTranslateReopsitory(cacheDuration: cacheDuration);

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
    );
  }
}
