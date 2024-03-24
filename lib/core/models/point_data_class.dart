import 'dart:ui';

class PointDataClass {
  PointDataClass({
    required this.offset,
    this.isTapped = false,
  });
  final Offset offset;
  final bool isTapped;

  PointDataClass copyWith({
    Offset? offset,
    bool? isTapped,
  }) {
    return PointDataClass(
      offset: offset ?? this.offset,
      isTapped: isTapped ?? this.isTapped,
    );
  }
}
