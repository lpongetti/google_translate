import 'package:google_translate/extensions/string_extension.dart';
import 'package:flutter/material.dart';

extension TranslateText on Text {
  /// Translate the text to the defined language.
  ///
  /// If the [placeholder] arguments is null then it will show three dots.
  Widget translate([String? placeholder]) {
    String? data = this.data;
    return FutureBuilder<String>(
        future: data?.translate(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          String response = placeholder ?? "...";
          if (snapshot.hasData) {
            response = snapshot.data!;
          }
          return Text(
            response,
            key: key,
            locale: locale,
            maxLines: maxLines,
            overflow: overflow,
            semanticsLabel: semanticsLabel,
            softWrap: softWrap,
            strutStyle: strutStyle,
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            textHeightBehavior: textHeightBehavior,
            textScaleFactor: textScaleFactor,
            textWidthBasis: textWidthBasis,
          );
        });
  }
}
