import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTheme {
  const AppTheme._();

  //  light 样式
  static ThemeData light() {
    final FlexColorScheme flexColorScheme = FlexColorScheme.light(
      // scheme: FlexScheme.aquaBlue,
      colors: _aquaBlueLight,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

    return flexColorScheme.toTheme;
  }

  //  dark 样式
  static ThemeData dark() {
    final FlexColorScheme flexColorScheme = FlexColorScheme.dark(
      // scheme: FlexScheme.aquaBlue,
      colors: _aquaBlueDart,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
    );

    return flexColorScheme.toTheme;
  }

  static const FlexSchemeColor _aquaBlueLight = FlexSchemeColor(
    primary: Color(0xff35a0cb),
    primaryContainer: Color(0xff71d3ed),
    secondary: Color(0xff89d1c8),
    secondaryContainer: Color(0xff91f4e8),
    tertiary: Color(0xff61d4d4),
    tertiaryContainer: Color(0xff8ff3f2),
    appBarColor: Color(0xff91f4e8),
    error: Color(0xffb00020),
  );

  static const FlexSchemeColor _aquaBlueDart = FlexSchemeColor(
    primary: Color(0xff5db3d5),
    primaryContainer: Color(0xff297ea0),
    secondary: Color(0xffa1e9df),
    secondaryContainer: Color(0xff005049),
    tertiary: Color(0xffa0e5e5),
    tertiaryContainer: Color(0xff004f50),
    appBarColor: Color(0xff005049),
    error: Color(0xffcf6679),
  );
}

final lightThemeProvider = Provider((ref) => AppTheme.light());

final darkThemeProvider = Provider((ref) => AppTheme.dark());
