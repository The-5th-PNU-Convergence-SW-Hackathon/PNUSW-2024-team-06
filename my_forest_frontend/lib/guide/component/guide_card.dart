import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/guide_model.dart';

class GuideCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String engTitle;
  final String description;

  const GuideCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.engTitle,
    required this.description,
  });

  factory GuideCard.fromModel({
    required GuideModel model,
    bool? isVertical,
  }) {
    return GuideCard(
      id: model.id,
      imageUrl: model.imageUrl,
      title: model.title,
      engTitle: model.engTitle,
      description: model.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 4.0, right: 4.0),
          child: Text(
            title,
            style: MyTextStyle.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 4.0, right: 4.0),
          child: Text(
            engTitle,
            style: MyTextStyle.descriptionRegular.copyWith(
              color: MyColor.darkGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
