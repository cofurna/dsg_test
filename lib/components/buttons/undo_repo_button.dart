import 'package:dsg_test/components/buttons/app_buttons_icon.dart';
import 'package:dsg_test/core/extensions/context_ext.dart';
import 'package:dsg_test/core/models/button_colors.dart';
import 'package:dsg_test/statics/app_icons.dart';
import 'package:flutter/material.dart';

class UndoRepoButton extends StatelessWidget {
  const UndoRepoButton({
    required this.onUndo,
    required this.onRepo,
    required this.canRepo,
    required this.canUndo,
    super.key,
  });

  final VoidCallback onUndo;
  final VoidCallback onRepo;
  final bool canUndo;
  final bool canRepo;
  @override
  Widget build(BuildContext context) {
    final buttonColors = ButtonColors(
      buttonActiveColor: context.colors.grey100,
      buttonPressedColor: context.colors.grey200,
      buttonDisableColor: context.colors.grey100,
    );
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
          color: context.colors.grey100,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            height: 30,
            width: 30,
            onTap: canUndo ? onUndo : () {},
            icon: AppIcons.undo,
            buttonColors: buttonColors,
            iconColor:
                canUndo ? context.colors.grey500 : context.colors.grey300,
          ),
          Container(
            height: 12,
            width: 1,
            color: context.colors.grey400,
          ),
          AppIconButton(
            height: 30,
            width: 30,
            onTap: canRepo ? onRepo : () {},
            icon: AppIcons.repo,
            buttonColors: buttonColors,
            iconColor:
                canRepo ? context.colors.grey500 : context.colors.grey300,
          ),
        ],
      ),
    );
  }
}
