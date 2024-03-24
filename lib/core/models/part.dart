import 'package:freezed_annotation/freezed_annotation.dart';
part 'part.freezed.dart';

@freezed
class Part with _$Part {
  // const factory Part.line() = _Line;
  const factory Part.point() = _Point;
  const factory Part.newPoint() = _NewPoint;
  const factory Part.noPart() = _NoPart;
}
