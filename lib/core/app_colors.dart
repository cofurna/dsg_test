import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.select,
    required this.primary,
    required this.secondary,
    required this.black,
    required this.grey500,
    required this.grey400,
    required this.grey300,
    required this.grey200,
    required this.grey100,
    required this.grey000,
  });
  final Color select;
  final Color primary;
  final Color secondary;
  final Color black;
  final Color grey500;
  final Color grey400;
  final Color grey300;
  final Color grey200;
  final Color grey100;
  final Color grey000;

  @override
  AppColors copyWith({
    Color? select,
    Color? primary,
    Color? secondary,
    Color? black,
    Color? grey500,
    Color? grey400,
    Color? grey300,
    Color? grey200,
    Color? grey100,
    Color? grey000,
  }) {
    return AppColors(
      select: select ?? this.select,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      black: black ?? this.black,
      grey500: grey500 ?? this.grey500,
      grey400: grey400 ?? this.grey400,
      grey300: grey300 ?? this.grey300,
      grey200: grey200 ?? this.grey200,
      grey100: grey100 ?? this.grey100,
      grey000: grey000 ?? this.grey000,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      select: Color.lerp(select, other.select, t) ?? select,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      black: Color.lerp(black, other.black, t) ?? black,
      grey000: Color.lerp(grey000, other.grey000, t) ?? grey000,
      grey100: Color.lerp(grey100, other.grey100, t) ?? grey100,
      grey200: Color.lerp(grey200, other.grey200, t) ?? grey200,
      grey300: Color.lerp(grey300, other.grey300, t) ?? grey300,
      grey400: Color.lerp(grey400, other.grey400, t) ?? grey400,
      grey500: Color.lerp(grey500, other.grey500, t) ?? grey500,
    );
  }
}
