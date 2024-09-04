import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/data.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';

class PotHorizontalItemList extends ConsumerWidget {
  const PotHorizontalItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const itemSpacing = 8.0;
    const paddingSpacing = 24.0;
    final itemWidth = (MediaQuery.of(context).size.width -
            paddingSpacing * 2 -
            itemSpacing * 3) /
        4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingSpacing),
      child: Wrap(
        runSpacing: itemSpacing,
        spacing: itemSpacing,
        children: List.generate(
          8,
          (int index) => SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColor.lightGrey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      "${ImagePath.potDirectory}$index.png",
                      fit: BoxFit.cover,
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${DataUtils.convertPriceToMoneyString(price: potItems[index])} 원',
                  style: MyTextStyle.descriptionBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
