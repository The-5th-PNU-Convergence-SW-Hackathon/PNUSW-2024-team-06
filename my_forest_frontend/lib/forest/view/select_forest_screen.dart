import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/layout/default_layout.dart';
import 'package:my_forest_frontend/forest/component/forest_vertical_item_grid.dart';
import 'package:my_forest_frontend/forest/provider/forest_provider.dart';

import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';

class SelectForestScreen extends ConsumerWidget {
  static String get routeName => "select_forest";

  const SelectForestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forests = ref.watch(forestProvider);

    return DefaultLayout(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImagePath.defaultBackground),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '반려 식물 선택하기',
                        style: MyTextStyle.bodyTitleBold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '한 번 고른 반려 식물은 변경 불가능하니 신중히 결정해 주세요.',
                        style: MyTextStyle.minimumRegular.copyWith(
                          color: MyColor.darkGrey,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(child: ForestVerticalItemGrid(forests: forests)),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
