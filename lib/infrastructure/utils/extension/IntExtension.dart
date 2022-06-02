// ignore_for_file: file_names

import 'package:intl/intl.dart';

extension IntExtension on int {
  String toRupiah({bool isRemoveRp = false}) {
    final oCcy = NumberFormat("#,###", "id_ID");
    return this == 0 ? "0" : (isRemoveRp ? "" : "Rp") + oCcy.format(this);
  }
}
