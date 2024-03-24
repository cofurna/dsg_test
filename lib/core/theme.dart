import 'package:dsg_test/core/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  extensions: const [
    AppColors(
      select: Color(0xFF377BBB),
      primary: Color(0xFF0098EE),
      secondary: Color(0xFF0098EE),
      black: Color(0xFF000000),
      grey500: Color(0xFF7D7D7D),
      grey400: Color(0xFFA7A7A7),
      grey300: Color(0xFFC6C6C8),
      grey200: Color(0xFFE3E3E3),
      grey100: Color(0xFFF6F6F6),
      grey000: Color(0xFFFDFDFD),
    ),
  ],
);
