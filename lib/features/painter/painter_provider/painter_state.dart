import 'dart:ui';

import 'package:dsg_test/core/models/draggin_data_class.dart';
import 'package:dsg_test/core/models/part.dart';
import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'painter_state.freezed.dart';

@freezed
class PainterState with _$PainterState {
  const factory PainterState({
    @Default(false) bool hasShadedArea,
    @Default([]) List<PointDataClass> pointsList,
    Offset? selectedPoint,
    @Default(DraggingDataClass(part: Part.noPart())) DraggingDataClass dragging,
    @Default([]) List<List<PointDataClass>> savedPointsLists,
    @Default(-1) int savedIndex,
    @Default(false) bool girdIsSelect,
  }) = _PainterState;

  const PainterState._();

  bool get canRepo => savedIndex < savedPointsLists.length - 1;
  bool get canUndo => savedIndex > -1;
}
