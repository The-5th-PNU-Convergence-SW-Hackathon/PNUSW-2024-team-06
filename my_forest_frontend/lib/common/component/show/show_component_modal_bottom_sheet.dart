import 'package:flutter/material.dart';

import '../../const/colors.dart';

void showCustomModalBottomSheet({
  required BuildContext context,
  required Widget bottomSheetWidget,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: true,
    context: context,
    barrierColor: MyColor.barrier,
    backgroundColor: MyColor.empty,
    builder: (_) {
      return bottomSheetWidget;
    },
  );
}
