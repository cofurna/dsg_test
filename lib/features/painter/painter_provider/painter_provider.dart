import 'package:dsg_test/core/extensions/double_ext.dart';
import 'package:dsg_test/core/models/draggin_data_class.dart';
import 'package:dsg_test/core/models/part.dart';
import 'package:dsg_test/core/models/point_data_class.dart';
import 'package:dsg_test/core/utils.dart';
import 'package:dsg_test/features/painter/painter_provider/painter_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class PainterProvider extends StateNotifier<PainterState> {
  PainterProvider() : super(const PainterState());

  void onPanStart(DragStartDetails details) {
    final dragging = Utils.shouldGrab(
      state.pointsList,
      details.globalPosition,
    );

    state = state.copyWith(dragging: dragging);

    dragging.part.when(
      point: _onPointPanStart,
      newPoint: () => _onNewPointPanStart(details),
      noPart: () {},
    );
  }

  void onPanEnd() {
    if (state.dragging.index == null) {
      _resetSelectPoint();

      return;
    }

    if (state.dragging.index! != -1 && state.selectedPoint != null) {
      final list = List<PointDataClass>.from(state.pointsList);

      if (state.girdIsSelect) {
        list[state.dragging.index!] = PointDataClass(
          offset: Offset(
            state.selectedPoint!.dx.roundToMultipleGirdStep(),
            state.selectedPoint!.dy.roundToMultipleGirdStep(),
          ),
        );
      } else {
        list[state.dragging.index!] = PointDataClass(
          offset: state.selectedPoint!,
        );
      }

      var savedList = [...state.savedPointsLists, list];

      if (state.savedIndex != state.savedPointsLists.length - 1) {
        savedList = [
          ...state.savedPointsLists.sublist(0, state.savedIndex + 1),
          list
        ];
      }

      state = state.copyWith(
        pointsList: list,
        hasShadedArea: list.length > 3,
        savedIndex: savedList.length - 1,
        savedPointsLists: savedList,
      );
    }

    _resetSelectPoint();
  }

  void _resetSelectPoint() {
    state = state.copyWith(
      dragging: const DraggingDataClass(part: Part.noPart()),
      selectedPoint: null,
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (state.dragging.part == const Part.noPart()) {
      return;
    }

    state = state.copyWith(
      selectedPoint: state.selectedPoint! + details.delta,
    );
  }

  void _onPointPanStart() {
    if (state.dragging.index == null) {
      return;
    }

    final list = List<PointDataClass>.from(state.pointsList);

    list[state.dragging.index!] =
        list[state.dragging.index!].copyWith(isTapped: true);

    state = state.copyWith(
      selectedPoint: state.pointsList[state.dragging.index!].offset,
      pointsList: list,
    );
  }

  void _onNewPointPanStart(DragStartDetails details) {
    final selectedPoint = details.globalPosition;

    final newList = [
      ...state.pointsList,
      PointDataClass(offset: selectedPoint, isTapped: true),
    ];

    state = state.copyWith(
      selectedPoint: selectedPoint,
      pointsList: newList,
    );
  }

  void changeGirdSelet() {
    if (!state.girdIsSelect) {
      state = state.copyWith(
        girdIsSelect: !state.girdIsSelect,
        pointsList: getListWithSelectedGird(state.pointsList),
      );

      return;
    }

    state = state.copyWith(girdIsSelect: !state.girdIsSelect);
  }

  void onUndo() {
    if (state.pointsList.length == 1) {
      state = state.copyWith(
        pointsList: [],
        hasShadedArea: false,
        savedIndex: -1,
      );

      return;
    }

    _setSavedListByIndex(state.savedIndex - 1);
  }

  void onRepo() {
    _setSavedListByIndex(state.savedIndex + 1);
  }

  void _setSavedListByIndex(int index) {
    final pointsList = state.girdIsSelect
        ? getListWithSelectedGird(state.savedPointsLists[index])
        : state.savedPointsLists[index];

    state = state.copyWith(
      pointsList: pointsList,
      hasShadedArea: pointsList.length > 3,
      savedIndex: index,
    );
  }

  List<PointDataClass> getListWithSelectedGird(
    List<PointDataClass> pointsList,
  ) {
    final List<PointDataClass> newList = [];

    for (final point in pointsList) {
      final newOffset = Offset(
        point.offset.dx.roundToMultipleGirdStep(),
        point.offset.dy.roundToMultipleGirdStep(),
      );

      final newPoint = point.copyWith(offset: newOffset);

      newList.add(newPoint);
    }

    return newList;
  }
}
