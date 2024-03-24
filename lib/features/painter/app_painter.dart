import 'package:dsg_test/components/buttons/app_buttons_icon.dart';
import 'package:dsg_test/components/buttons/undo_repo_button.dart';
import 'package:dsg_test/components/painters/line_painter.dart';
import 'package:dsg_test/components/painters/points_painter.dart';
import 'package:dsg_test/components/painters/shared_area_painter.dart';
import 'package:dsg_test/components/painters/text_painter.dart';
import 'package:dsg_test/core/extensions/context_ext.dart';
import 'package:dsg_test/core/models/button_colors.dart';
import 'package:dsg_test/core/shadows.dart';
import 'package:dsg_test/features/painter/painter_provider/painter_provider.dart';
import 'package:dsg_test/features/painter/painter_provider/painter_state.dart';
import 'package:dsg_test/statics/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppPainter extends ConsumerStatefulWidget {
  const AppPainter({super.key});

  @override
  ConsumerState<AppPainter> createState() => _AppPainterState();
}

class _AppPainterState extends ConsumerState<AppPainter> {
  late final StateNotifierProvider<PainterProvider, PainterState> _provider;

  @override
  void initState() {
    _provider = StateNotifierProvider<PainterProvider, PainterState>(
      (ref) => PainterProvider(),
    );

    super.initState();
  }

  ButtonColors get _buttonColors => ButtonColors(
        buttonActiveColor: context.colors.grey100,
        buttonPressedColor: context.colors.grey200,
        buttonDisableColor: context.colors.grey100,
      );

  Color _gridButtonIconColor(PainterState state) {
    if (state.girdIsSelect) {
      return context.colors.grey500;
    }

    return context.colors.grey400;
  }

  Widget _buildGridButton(PainterState state) {
    return Positioned(
      top: 40,
      right: 16,
      child: AppIconButton(
        onTap: () => ref.read(_provider.notifier).changeGirdSelet(),
        icon: AppIcons.gird,
        buttonColors: _buttonColors,
        iconColor: _gridButtonIconColor(state),
        radius: 30,
        shadows: Shadows.shadow100,
        iconSize: 30,
      ),
    );
  }

  Widget _buildUndoRepoButtons(PainterState state) {
    return Positioned(
      top: 40,
      left: 8,
      child: UndoRepoButton(
        onUndo: ref.read(_provider.notifier).onUndo,
        onRepo: ref.read(_provider.notifier).onRepo,
        canRepo: state.canRepo,
        canUndo: state.canUndo,
      ),
    );
  }

  Widget _buildPointBg(PainterState state) {
    return CustomPaint(
      painter: PointsPainter(
        pointBorderColor: state.hasShadedArea
            ? context.colors.grey500
            : context.colors.grey000,
        selectPointBorderColor: context.colors.secondary,
        pointColor: state.hasShadedArea
            ? context.colors.grey000
            : context.colors.primary,
        selectPointColor: context.colors.grey000,
        pointsList: state.pointsList,
        selectPoint: state.selectedPoint,
      ),
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);

    return GestureDetector(
      onPanStart: ref.read(_provider.notifier).onPanStart,
      onPanEnd: (_) => ref.read(_provider.notifier).onPanEnd(),
      onPanUpdate: ref.read(_provider.notifier).onPanUpdate,
      child: Stack(
        children: [
          if (state.hasShadedArea)
            CustomPaint(
              painter: SharedAreaPainter(
                pointsList: state.pointsList,
                selectedPoint: state.selectedPoint,
                areaColor: context.colors.grey000,
              ),
            ),
          if (state.hasShadedArea)
            CustomPaint(
              painter: AppTextPainter(
                pointsList: state.pointsList,
                selectedPoint: state.selectedPoint,
                textColor: context.colors.primary,
              ),
            ),
          CustomPaint(
            painter: LinePainter(
              pointsList: state.pointsList,
              selectedPoint: state.selectedPoint,
              lineColor: context.colors.black,
              hasSharedArea: state.hasShadedArea,
            ),
          ),
          _buildPointBg(state),
          _buildUndoRepoButtons(state),
          _buildGridButton(state),
        ],
      ),
    );
  }
}
