import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';
import '../default_button.dart';

class CustomGeneralDialogBottomSheetWidget extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback onPressed;
  final String buttonText;

  const CustomGeneralDialogBottomSheetWidget({
    super.key,
    required this.title,
    this.description,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: description == null ? 180.0 : 248.0,
      color: MyColor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: MyTextStyle.bodyTitleBold,
              textAlign: TextAlign.center,
            ),
            if (description != null) const SizedBox(height: 20.0),
            if (description != null)
              Expanded(
                child: Text(
                  description!,
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20.0),
            PrimaryButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
