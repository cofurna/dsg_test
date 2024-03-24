import 'package:dsg_test/components/buttons/base_button.dart';
import 'package:dsg_test/core/models/button_colors.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget with BaseButton {
  const AppIconButton({
    required this.onTap,
    required this.icon,
    required this.buttonColors,
    required this.iconColor,
    this.onDoubleTap,
    this.width = 46,
    this.height = 46,
    this.iconSize = 16,
    this.radius = 12,
    this.shadows,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final double iconSize;
  final Color iconColor;

  final ButtonColors buttonColors;
  final double radius;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return super.buildButton(
      width: width,
      height: height,
      key: key,
    );
  }

  @override
  Widget? get bodyWidget => Icon(
        icon,
        size: iconSize,
        color: iconColor,
      );

  @override
  VoidCallback? get onPressed => onTap;
  @override
  VoidCallback? get onDoublePressed => onDoubleTap;

  @override
  Color get activeColor => buttonColors.buttonActiveColor;
  @override
  Color get pressedColor => buttonColors.buttonPressedColor;
  @override
  Color get disabledColor => buttonColors.buttonDisableColor;
  @override
  BorderRadius get borderRadius => BorderRadius.circular(radius);
  @override
  List<BoxShadow>? get boxShadow => shadows;
}
