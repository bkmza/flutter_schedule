import 'package:flutter/material.dart';

final ThemeData _androidTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    accentColor: Color.fromRGBO(46, 157, 180, 1),
    buttonColor: Color.fromRGBO(46, 157, 180, 1));

final ThemeData _iOSTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    accentColor: Color.fromRGBO(46, 157, 180, 1),
    buttonColor: Color.fromRGBO(46, 157, 180, 1));

ThemeData getAdaptiveThemeData(context) {
  return Theme.of(context).platform == TargetPlatform.android
      ? _androidTheme
      : _iOSTheme;
}
