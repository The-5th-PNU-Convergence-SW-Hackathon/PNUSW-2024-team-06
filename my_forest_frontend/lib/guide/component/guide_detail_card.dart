import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/guide_model.dart';

class GuideDetailCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String engTitle;
  final String description;

  const GuideDetailCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.engTitle,
    required this.description,
  });

  factory GuideDetailCard.fromModel({
    required GuideModel model,
    bool? isVertical,
  }) {
    return GuideDetailCard(
      id: model.id,
      imageUrl: model.imageUrl,
      title: model.title,
      engTitle: model.engTitle,
      description: model.description,
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
          const SizedBox(height: 16.0),
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
              engTitle,
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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
