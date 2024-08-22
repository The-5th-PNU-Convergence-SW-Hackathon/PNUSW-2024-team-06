import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/const/colors.dart';

void showCustomGeneralDialog({
  required BuildContext context,
  required Widget bottomSheetWidget,
}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: MyColor.barrier,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(anim),
        child: child,
      );
    },
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: bottomSheetWidget,
            ),
          ),
        ),
      );
    },
  );
}
