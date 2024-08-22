import 'package:flutter/cupertino.dart';

import '../../const/text_styles.dart';

void showCustomCupertinoAlert({
  required BuildContext context,
  required Widget titleWidget,
  required String completeText,
  required VoidCallback completeFunction,
  required String cancelText,
  required VoidCallback cancelFunction,
  Widget? contentWidget,
}) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: titleWidget,
        content: contentWidget,
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: completeFunction,
            child: Text(
              completeText,
              style: MyTextStyle.bodyRegular.copyWith(
                height: 1.0,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: cancelFunction,
            child: Text(
              cancelText,
              style: MyTextStyle.bodyRegular.copyWith(
                height: 1.0,
                color: CupertinoColors.activeBlue,
              ),
            ),
          )
        ],
      );
    },
  );
}
