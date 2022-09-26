import 'dart:core';

import 'package:flutter/material.dart';

import 'google_translate_controller.dart';

class GoogleTranslate extends StatelessWidget {
  final String apiKey;
  final String sourceLanguage;
  final String targetLanguage;
  final Duration cacheDuration;
  final Widget child;

  const GoogleTranslate({
    super.key,
    required this.apiKey,
    required this.sourceLanguage,
    required this.targetLanguage,
    this.cacheDuration = const Duration(days: 7),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    GoogleTranslateController.init(
        apiKey: apiKey,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        cacheDuration: cacheDuration);

    return child;
  }
}
