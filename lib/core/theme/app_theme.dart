import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.blue,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),

    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.tajawal(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.tajawal(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.tajawal(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.tajawal(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle:  GoogleFonts.tajawal(
          fontSize: 15,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(32),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(32),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.black,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: AppColors.black.withAlpha(125),
    ),

    navigationBarTheme: NavigationBarThemeData(
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.black
              : AppColors.black.withAlpha(125),
        );
      }),
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      indicator: BoxDecoration(
        color: AppColors.red.withAlpha(15),
        border: Border.all(color: AppColors.black.withAlpha(25), width: 1.3),
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      labelColor: AppColors.red,
      unselectedLabelColor: AppColors.black.withAlpha(125),
      unselectedLabelStyle: GoogleFonts.tajawal(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: GoogleFonts.tajawal(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      overlayColor: WidgetStateColor.transparent,
      dividerColor: Colors.transparent,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.2, color: AppColors.black.withAlpha(12)),
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(width: 2.2),
    ),
  );
}
