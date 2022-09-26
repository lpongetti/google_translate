import 'package:google_translate/components/google_translate_controller.dart';

extension Translate on String {
  // Translate your text from source to target language
  Future<String> translate({
    String? sourceLanguage,
    String? targetLanguage,
  }) {
    return GoogleTranslateController().translate(
      this,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    );
  }
}
