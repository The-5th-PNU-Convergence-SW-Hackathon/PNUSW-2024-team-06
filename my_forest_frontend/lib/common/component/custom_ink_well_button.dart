import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';

class CustomInkWellButton extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomInkWellButton({
    super.key,
    required this.title,
    this.description = '',
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: isSelected ? MyColor.primary : MyColor.middleGrey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: description.isEmpty
            ? Text(
                title,
                textAlign: TextAlign.center,
                style: MyTextStyle.bodyRegular.copyWith(
                  color: isSelected ? MyColor.primary : MyColor.darkGrey,
                ),
              )
            : Column(
                children: [
                  Text(
                    title,
                    style: MyTextStyle.bodyRegular.copyWith(
                      color: isSelected ? MyColor.primary : MyColor.darkGrey,
                    ),
                  ),
                  Text(
                    description,
                    style: MyTextStyle.bodyRegular.copyWith(
                      color: isSelected ? MyColor.primary : MyColor.darkGrey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
