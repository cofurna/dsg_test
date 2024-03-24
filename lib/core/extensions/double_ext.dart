import 'package:dsg_test/statics/app_consts.dart';

extension DoubleExt on double {
  double roundToMultipleGirdStep() {
    final to = AppConsts.girdStep.toInt();
    final int n = toInt();
    final mod = n % to;
    if (mod == 0) {
      return n.toDouble();
    } else {
      int nearest = n - mod;
      if (mod > to / 2) {
        nearest += to;
      }
      return nearest.toDouble();
    }
  }
}
