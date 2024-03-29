import 'package:flutter/material.dart';

/// Classe que fornece o tema do aplicativo.
sealed class AppTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  );

  /// Tema principal do aplicativo.
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade600,
      labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),
      contentPadding: const EdgeInsets.all(16),
      border: _defaultInputBorder,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade800,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple.shade500,
          width: 2.0,
        ),
      ),
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: BorderSide(
          color: Colors.redAccent.shade700,
          width: 2.0,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      textStyle: TextStyle(fontSize: 16),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.white60,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      collapsedBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide.none,
      ),
      iconColor: const Color.fromRGBO(18, 18, 18, 1),
      collapsedIconColor: Colors.white,
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const Color.fromRGBO(18, 18, 18, 1);
            }

            return Colors.white;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(color: Colors.white);
            }

            return const TextStyle(color: Colors.white);
          },
        ),
      ),
    ),
  );
}
