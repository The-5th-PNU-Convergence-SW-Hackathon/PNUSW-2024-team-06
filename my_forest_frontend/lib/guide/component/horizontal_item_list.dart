import 'package:flutter/material.dart';
import 'package:my_forest_frontend/guide/model/guide_model.dart';

import 'guide_card.dart';

class HorizontalItemList extends StatelessWidget {
  final List<GuideModel> guides;

  const HorizontalItemList({
    super.key,
    required this.guides,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        itemCount: guides.length,
        itemBuilder: (context, index) {
          final guide = guides[index];

          return GestureDetector(
            onTap: () {
              // context.pushNamed(
              //   ProductDetailScreen.routeName,
              //   pathParameters: {'id': guide.id.toString()},
              // );
            },
            child: GuideCard.fromModel(model: guide),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16.0);
        },
      ),
    );
  }
}
