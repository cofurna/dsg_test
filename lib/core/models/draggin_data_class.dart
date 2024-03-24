import 'package:dsg_test/core/models/part.dart';

import 'package:dsg_test/core/models/point_data_class.dart';

class DraggingDataClass {
  const DraggingDataClass({
    required this.part,
    this.index,
    this.point,
  });
  final PointDataClass? point;
  final int? index;
  final Part part;
}
