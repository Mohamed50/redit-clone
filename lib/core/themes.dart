import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData createTheme({
  required Brightness brightness,
  required MaterialColor primarySwatch,
  required SystemUiOverlayStyle systemOverlayStyle,
  required Color background,
  required Color primaryText,
  required Color secondaryText,
  required Color primaryColor,
  required Color accentColor,
  required TextTheme textTheme,
  Color? divider,
  Color? buttonBackground,
  required Color buttonText,
  Color? cardBackground,
  Color? disabled,
  required Color error,
  String? fontFamily,
}) {
  return ThemeData(
    brightness: brightness,
    canvasColor: background,
    cardColor: background,
    dividerColor: divider,
    textTheme: textTheme,
    dividerTheme: DividerThemeData(
      color: divider,
      space: 1,
      thickness: 1,
    ),
    cardTheme: CardTheme(
      color: cardBackground,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    primaryColor: primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: accentColor,
      selectionColor: accentColor,
      selectionHandleColor: accentColor,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: systemOverlayStyle,
      color: cardBackground,
      titleTextStyle: TextStyle(
        color: secondaryText,
        fontFamily: fontFamily,
        fontSize: 18,
      ),
      toolbarTextStyle: TextStyle(
        color: secondaryText,
        fontFamily: fontFamily,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
      ),
    ),
    iconTheme: IconThemeData(
      color: secondaryText,
      size: 16.0,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accentColor,
        secondary: accentColor,
        surface: background,
        background: background,
        error: error,
        onPrimary: buttonText,
        onSecondary: buttonText,
        onSurface: buttonText,
        onBackground: buttonText,
        onError: buttonText,
      ),
      padding: const EdgeInsets.all(16.0),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: brightness,
      primaryColor: accentColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        color: error,
      ),
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        color: primaryText.withOpacity(0.5),
      ),
      hintStyle: TextStyle(
        color: secondaryText,
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      ),
    ),
    fontFamily: fontFamily,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return accentColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return accentColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return accentColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return accentColor;
        }
        return null;
      }),
    ),
    colorScheme: ColorScheme.light(primary: primaryColor, secondary: accentColor)
        .copyWith(background: background)
        .copyWith(error: error),
  );
}

ThemeData theme = createTheme(
  brightness: Brightness.light,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  primarySwatch: Colors.red,
  background: Colors.black,
  primaryText: Colors.white,
  secondaryText: Colors.black,
  primaryColor: Colors.white,
  accentColor: Colors.white,
  divider: Colors.grey[200],
  buttonBackground: Colors.black38,
  buttonText: Colors.black,
  disabled: Colors.grey[500],
  error: Colors.red,
  textTheme: GoogleFonts.jostTextTheme(),
);
