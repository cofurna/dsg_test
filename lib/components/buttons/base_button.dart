import 'package:flutter/material.dart';

mixin BaseButton {
  Widget buildButton({
    required double height,
    double? width,
    Key? key,
  }) =>
      Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: borderAll,
              borderRadius: borderRadius,
              color: getButtonColor,
              boxShadow: boxShadow,
            ),
            child: Opacity(
              opacity: 0,
              child: Center(
                child: bodyWidget,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: pressedColor,
              highlightColor: pressedColor.withOpacity(0.5),
              borderRadius: borderRadius,
              onTap: onPressed,
              onDoubleTap: onDoublePressed,
              child: SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: bodyWidget,
                ),
              ),
            ),
          ),
        ],
      );

  Color? get getButtonColor {
    if (onPressed == null) {
      return disabledColor;
    }

    if (onPressed != null) {
      return activeColor;
    }
    return activeColor;
  }

  //Optional fields

  BorderRadius get borderRadius => BorderRadius.circular(12);
  VoidCallback? get onPressed => null;
  VoidCallback? get onDoublePressed => null;
  List<BoxShadow>? get boxShadow => null;
  BoxBorder? get borderAll => null;

  //Required fields
  Widget? get bodyWidget => throw UnimplementedError();
  Color get activeColor => throw UnimplementedError();
  Color get pressedColor => throw UnimplementedError();
  Color get disabledColor => throw UnimplementedError();
}
