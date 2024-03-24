import 'package:dsg_test/core/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
