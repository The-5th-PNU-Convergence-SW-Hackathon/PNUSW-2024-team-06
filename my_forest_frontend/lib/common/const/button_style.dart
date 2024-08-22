import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class MyButtonStyle {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    foregroundColor: MyColor.white,
    backgroundColor: MyColor.primary,
    disabledForegroundColor: MyColor.darkGrey,
    disabledBackgroundColor: MyColor.lightGrey,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.bodyBold.copyWith(
      color: MyColor.white,
      height: 1.0,
    ),
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    foregroundColor: MyColor.primary,
    backgroundColor: MyColor.white,
    disabledForegroundColor: MyColor.darkGrey,
    disabledBackgroundColor: MyColor.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 48),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.primary,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.bodyRegular.copyWith(
      color: MyColor.primary,
      height: 1.0,
    ),
  );

  static ButtonStyle container = ElevatedButton.styleFrom(
    foregroundColor: MyColor.darkGrey,
    backgroundColor: MyColor.white,
    disabledForegroundColor: MyColor.darkGrey,
    disabledBackgroundColor: MyColor.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 48),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.middleGrey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.bodyRegular.copyWith(
      height: 1.0,
    ),
    alignment: AlignmentDirectional.center,
  );

  static ButtonStyle disable = ElevatedButton.styleFrom(
    foregroundColor: MyColor.middleGrey,
    backgroundColor: MyColor.white,
    disabledForegroundColor: MyColor.middleGrey,
    disabledBackgroundColor: MyColor.white,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 48),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.middleGrey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.bodyRegular.copyWith(
      height: 1.0,
    ),
    alignment: AlignmentDirectional.center,
  );
}
