import 'package:flutter/material.dart';

sealed class AppTheme {
  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      backgroundColor: Colors.blueAccent,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static const _erroTextStyle = TextStyle(fontSize: 14);

  static const _defaultLabelStyle = TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const _defaultHintStyle = TextStyle(fontSize: 16);

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(color: Colors.grey.shade100),
  );

  static final _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: _colorScheme.copyWith(surface: Colors.grey.shade100),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.grey[50],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(16),
      outlineBorder: const BorderSide(color: Colors.transparent),
      labelStyle: _defaultLabelStyle,
      border: _defaultInputBorder,
      hintStyle: _defaultHintStyle,
      focusedBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: _defaultLabelStyle,
      errorStyle: _erroTextStyle,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    popupMenuTheme: PopupMenuThemeData(
      color: _colorScheme.surface,
      textStyle: TextStyle(color: _colorScheme.secondary),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: _colorScheme.primary),
  );

  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: _colorScheme.copyWith(surface: Colors.grey.shade800),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade800,
      titleTextStyle: TextStyle(
        color: Colors.grey.shade100,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: Colors.grey.shade100),
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _colorScheme.surface.withValues(alpha: 0.2),
      contentPadding: const EdgeInsets.all(16),
      labelStyle: _defaultLabelStyle,
      border: _defaultInputBorder,
      outlineBorder: const BorderSide(color: Colors.transparent),
      hintStyle: _defaultHintStyle.copyWith(color: Colors.white70),
      focusedBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: _defaultLabelStyle,
      errorStyle: _erroTextStyle.copyWith(color: Colors.redAccent),
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    popupMenuTheme: PopupMenuThemeData(
      color: _colorScheme.onSurface,
      textStyle: const TextStyle(color: Colors.white70),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.grey.shade900),
  );
}
