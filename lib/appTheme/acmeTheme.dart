import 'package:flutter/material.dart';

class AcmeAppTheme {
  //styles
  static ThemeData get themeDataLight {
    return ThemeData(
      textTheme: TextTheme(
        bodyText1: const TextStyle(fontSize: 14),
        bodyText2: const TextStyle(fontSize: 14),
        button: const TextStyle(fontSize: 14),
        caption: const TextStyle(fontSize: 12),
        headline1: const TextStyle(fontSize: 18),
        subtitle1: const TextStyle(
          fontSize: 14,
        ),
        subtitle2: const TextStyle(fontSize: 16),
        //toolbar
        overline: const TextStyle(fontSize: 16),
      ),
      dialogTheme: DialogTheme(),
    );
  }

  static InputDecoration textFormFieldDecoration(
          {String labelText,
          String hintText,
          Icon prefixIconData,
          IconButton suffixIcon}) =>
      InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIconData,
        suffixIcon: suffixIcon,
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      );
}
