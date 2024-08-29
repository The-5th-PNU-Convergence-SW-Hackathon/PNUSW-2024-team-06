import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/guide/component/guide_card.dart';
import 'package:my_forest_frontend/guide/model/guide_model.dart';

import 'guide_detail_card.dart';

class GuideVerticalItemGrid extends ConsumerWidget {
  final List<GuideModel> guides;

  const GuideVerticalItemGrid({
    super.key,
    required this.guides,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double itemSpacing = 16.0;
    const double horizontalPadding = 24.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: itemSpacing,
        crossAxisSpacing: itemSpacing,
        childAspectRatio: itemWidth / (itemWidth + 80),
      ),
      itemCount: guides.length,
      itemBuilder: (context, index) {
        final guide = guides[index];

        return GestureDetector(
          onTap: () {
            showCustomGeneralDialog(
              context: context,
              bottomSheetWidget: GuideDetailCard.fromModel(model: guide),
            );
          },
          child: GuideCard.fromModel(model: guide),
        );
      },
    );
  }
}
