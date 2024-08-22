import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

void showCustomToast(
  context, {
  required String msg,
  Duration? toastDuration,
  Color backgroundColor = Colors.green,
  Color foregroundColor = MyColor.text,
}) {
  final fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    color: MyColor.barrier.withOpacity(0.1),
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: MyColor.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhosphorIcon(
                PhosphorIcons.checkCircle(),
                size: 32.0,
                color: MyColor.text,
              ),
              const SizedBox(width: 12.0),
              Text(
                msg,
                style: MyTextStyle.bodyTitleMedium.copyWith(
                  color: foregroundColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: toastDuration ?? const Duration(seconds: 1),
    positionedToastBuilder: (context, child) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          child,
        ],
      );
    },
  );
}
