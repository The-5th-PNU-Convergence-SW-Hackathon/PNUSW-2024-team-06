import 'package:flutter/material.dart';
import 'package:my_forest_frontend/forest/model/forest_model.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/enum/forest_status.dart';

class ForestCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String nickname;
  final String title;
  final String engTitle;
  final String description;

  const ForestCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.nickname,
    required this.title,
    required this.engTitle,
    required this.description,
  });

  factory ForestCard.fromModel({
    required ForestModel model,
  }) {
    return ForestCard(
      id: model.id,
      imageUrl: model.imageUrl,
      nickname: model.nickname,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
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
