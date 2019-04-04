import 'package:flutter/material.dart';

final ThemeData _androidTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    accentColor: Colors.deepPurple,
    buttonColor: Colors.deepPurple);

final ThemeData _iOSTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    accentColor: Colors.lightBlue,
    buttonColor: Colors.lightBlue);

ThemeData getAdaptiveThemeData(context) {
  return Theme.of(context).platform == TargetPlatform.android
      ? _androidTheme
      : _iOSTheme;
}
