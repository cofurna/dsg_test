// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PainterState {
  bool get hasShadedArea => throw _privateConstructorUsedError;
  List<PointDataClass> get pointsList => throw _privateConstructorUsedError;
  Offset? get selectedPoint => throw _privateConstructorUsedError;
  DraggingDataClass get dragging => throw _privateConstructorUsedError;
  List<List<PointDataClass>> get savedPointsLists =>
      throw _privateConstructorUsedError;
  int get savedIndex => throw _privateConstructorUsedError;
  bool get girdIsSelect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PainterStateCopyWith<PainterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PainterStateCopyWith<$Res> {
  factory $PainterStateCopyWith(
          PainterState value, $Res Function(PainterState) then) =
      _$PainterStateCopyWithImpl<$Res, PainterState>;
  @useResult
  $Res call(
      {bool hasShadedArea,
      List<PointDataClass> pointsList,
      Offset? selectedPoint,
      DraggingDataClass dragging,
      List<List<PointDataClass>> savedPointsLists,
      int savedIndex,
      bool girdIsSelect});
}

/// @nodoc
class _$PainterStateCopyWithImpl<$Res, $Val extends PainterState>
    implements $PainterStateCopyWith<$Res> {
  _$PainterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasShadedArea = null,
    Object? pointsList = null,
    Object? selectedPoint = freezed,
    Object? dragging = null,
    Object? savedPointsLists = null,
    Object? savedIndex = null,
    Object? girdIsSelect = null,
  }) {
    return _then(_value.copyWith(
      hasShadedArea: null == hasShadedArea
          ? _value.hasShadedArea
          : hasShadedArea // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsList: null == pointsList
          ? _value.pointsList
          : pointsList // ignore: cast_nullable_to_non_nullable
              as List<PointDataClass>,
      selectedPoint: freezed == selectedPoint
          ? _value.selectedPoint
          : selectedPoint // ignore: cast_nullable_to_non_nullable
              as Offset?,
      dragging: null == dragging
          ? _value.dragging
          : dragging // ignore: cast_nullable_to_non_nullable
              as DraggingDataClass,
      savedPointsLists: null == savedPointsLists
          ? _value.savedPointsLists
          : savedPointsLists // ignore: cast_nullable_to_non_nullable
              as List<List<PointDataClass>>,
      savedIndex: null == savedIndex
          ? _value.savedIndex
          : savedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      girdIsSelect: null == girdIsSelect
          ? _value.girdIsSelect
          : girdIsSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PainterStateImplCopyWith<$Res>
    implements $PainterStateCopyWith<$Res> {
  factory _$$PainterStateImplCopyWith(
          _$PainterStateImpl value, $Res Function(_$PainterStateImpl) then) =
      __$$PainterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasShadedArea,
      List<PointDataClass> pointsList,
      Offset? selectedPoint,
      DraggingDataClass dragging,
      List<List<PointDataClass>> savedPointsLists,
      int savedIndex,
      bool girdIsSelect});
}

/// @nodoc
class __$$PainterStateImplCopyWithImpl<$Res>
    extends _$PainterStateCopyWithImpl<$Res, _$PainterStateImpl>
    implements _$$PainterStateImplCopyWith<$Res> {
  __$$PainterStateImplCopyWithImpl(
      _$PainterStateImpl _value, $Res Function(_$PainterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasShadedArea = null,
    Object? pointsList = null,
    Object? selectedPoint = freezed,
    Object? dragging = null,
    Object? savedPointsLists = null,
    Object? savedIndex = null,
    Object? girdIsSelect = null,
  }) {
    return _then(_$PainterStateImpl(
      hasShadedArea: null == hasShadedArea
          ? _value.hasShadedArea
          : hasShadedArea // ignore: cast_nullable_to_non_nullable
              as bool,
      pointsList: null == pointsList
          ? _value._pointsList
          : pointsList // ignore: cast_nullable_to_non_nullable
              as List<PointDataClass>,
      selectedPoint: freezed == selectedPoint
          ? _value.selectedPoint
          : selectedPoint // ignore: cast_nullable_to_non_nullable
              as Offset?,
      dragging: null == dragging
          ? _value.dragging
          : dragging // ignore: cast_nullable_to_non_nullable
              as DraggingDataClass,
      savedPointsLists: null == savedPointsLists
          ? _value._savedPointsLists
          : savedPointsLists // ignore: cast_nullable_to_non_nullable
              as List<List<PointDataClass>>,
      savedIndex: null == savedIndex
          ? _value.savedIndex
          : savedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      girdIsSelect: null == girdIsSelect
          ? _value.girdIsSelect
          : girdIsSelect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PainterStateImpl extends _PainterState {
  const _$PainterStateImpl(
      {this.hasShadedArea = false,
      final List<PointDataClass> pointsList = const [],
      this.selectedPoint,
      this.dragging = const DraggingDataClass(part: Part.noPart()),
      final List<List<PointDataClass>> savedPointsLists = const [],
      this.savedIndex = -1,
      this.girdIsSelect = false})
      : _pointsList = pointsList,
        _savedPointsLists = savedPointsLists,
        super._();

  @override
  @JsonKey()
  final bool hasShadedArea;
  final List<PointDataClass> _pointsList;
  @override
  @JsonKey()
  List<PointDataClass> get pointsList {
    if (_pointsList is EqualUnmodifiableListView) return _pointsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pointsList);
  }

  @override
  final Offset? selectedPoint;
  @override
  @JsonKey()
  final DraggingDataClass dragging;
  final List<List<PointDataClass>> _savedPointsLists;
  @override
  @JsonKey()
  List<List<PointDataClass>> get savedPointsLists {
    if (_savedPointsLists is EqualUnmodifiableListView)
      return _savedPointsLists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedPointsLists);
  }

  @override
  @JsonKey()
  final int savedIndex;
  @override
  @JsonKey()
  final bool girdIsSelect;

  @override
  String toString() {
    return 'PainterState(hasShadedArea: $hasShadedArea, pointsList: $pointsList, selectedPoint: $selectedPoint, dragging: $dragging, savedPointsLists: $savedPointsLists, savedIndex: $savedIndex, girdIsSelect: $girdIsSelect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PainterStateImpl &&
            (identical(other.hasShadedArea, hasShadedArea) ||
                other.hasShadedArea == hasShadedArea) &&
            const DeepCollectionEquality()
                .equals(other._pointsList, _pointsList) &&
            (identical(other.selectedPoint, selectedPoint) ||
                other.selectedPoint == selectedPoint) &&
            (identical(other.dragging, dragging) ||
                other.dragging == dragging) &&
            const DeepCollectionEquality()
                .equals(other._savedPointsLists, _savedPointsLists) &&
            (identical(other.savedIndex, savedIndex) ||
                other.savedIndex == savedIndex) &&
            (identical(other.girdIsSelect, girdIsSelect) ||
                other.girdIsSelect == girdIsSelect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasShadedArea,
      const DeepCollectionEquality().hash(_pointsList),
      selectedPoint,
      dragging,
      const DeepCollectionEquality().hash(_savedPointsLists),
      savedIndex,
      girdIsSelect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PainterStateImplCopyWith<_$PainterStateImpl> get copyWith =>
      __$$PainterStateImplCopyWithImpl<_$PainterStateImpl>(this, _$identity);
}

abstract class _PainterState extends PainterState {
  const factory _PainterState(
      {final bool hasShadedArea,
      final List<PointDataClass> pointsList,
      final Offset? selectedPoint,
      final DraggingDataClass dragging,
      final List<List<PointDataClass>> savedPointsLists,
      final int savedIndex,
      final bool girdIsSelect}) = _$PainterStateImpl;
  const _PainterState._() : super._();

  @override
  bool get hasShadedArea;
  @override
  List<PointDataClass> get pointsList;
  @override
  Offset? get selectedPoint;
  @override
  DraggingDataClass get dragging;
  @override
  List<List<PointDataClass>> get savedPointsLists;
  @override
  int get savedIndex;
  @override
  bool get girdIsSelect;
  @override
  @JsonKey(ignore: true)
  _$$PainterStateImplCopyWith<_$PainterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
