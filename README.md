# Google translate

[![pub package](https://img.shields.io/pub/v/google_translate.svg)](https://pub.dartlang.org/packages/google_translate) ![travis](https://api.travis-ci.com/lpongetti/google_translate.svg?branch=master)

Google Translate API for Dart.

## Usage

Add google_translate to your pubspec:

```yaml
dependencies:
  google_translate: any # or the latest version on Pub
```

Configure it in you Flutter app.

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GoogleTranslate.initialize(
    apiKey: "you api key",
    sourceLanguage: "en",
    targetLanguage: "it",
  )

  runApp(const MyApp());
}
```

Use it

```dart
'example'.translate().then((value) {
    setState(() {
        title = value;
    });
});
```

or

```dart
'esempio'.translate(sourceLanguage: 'it', targetLanguage: 'en').then((value) {
    setState(() {
        title = value;
    });
});
```

### Run the example

See the `example/` folder for a working example app.

## Supporting Me

A donation through my Ko-Fi page would be infinitly appriciated:
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/lorenzopongetti)

but, if you can't or won't, a star on GitHub and a like on pub.dev would also go a long way!

Every donation gives me fuel to continue my open-source projects and lets me know that I'm doing a good job.
