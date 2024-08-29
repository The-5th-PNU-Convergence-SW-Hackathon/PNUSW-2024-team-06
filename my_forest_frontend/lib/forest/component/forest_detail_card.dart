import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/enum/forest_status.dart';
import '../model/forest_model.dart';

class ForestDetailCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String nickname;
  final String title;
  final String description;
  final ForestStatus status;

  const ForestDetailCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.nickname,
    required this.title,
    required this.description,
    required this.status,
  });

  factory ForestDetailCard.fromModel({
    required ForestModel model,
  }) {
    return ForestDetailCard(
      id: model.id,
      imageUrl: model.imageUrl,
      nickname: model.nickname,
      title: model.title,
      description: model.description,
      status: model.status,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: MyColor.white,
      width: size.width - 60,
      height: size.height - 320,
      // height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: MyTextStyle.bodyTitleMedium,
            ),
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: MyTextStyle.bodyTitleRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: MyTextStyle.descriptionRegular.copyWith(
                color: MyColor.darkGrey,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
