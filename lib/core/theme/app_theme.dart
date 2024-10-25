import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,

    // textTheme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: semiBoldStyle(),
      displaySmall: regularStyle(),
    ),

    //text field
    inputDecorationTheme: InputDecorationTheme(
      //enabled border
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      //fouced border
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      // focused error border
      focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      //error border
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      // disabled border
      disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      //hint
      hintStyle: semiBoldStyle(color: AppColors.grey),
    ),

    // text button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.grey),
        textStyle: WidgetStateProperty.all(
          regularStyle(),
        ),
      ),
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    // progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),

    // app bar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
    ),
  );
}
