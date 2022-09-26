import 'package:flutter_test/flutter_test.dart';
import 'package:google_translate/google_translate.dart';

void main() {
  test('addObject', () {
    final controller = GoogleTranslateController.init(
        apiKey: "", sourceLanguage: "en", targetLanguage: "it");

    identical(controller, GoogleTranslateController());
  });
}
