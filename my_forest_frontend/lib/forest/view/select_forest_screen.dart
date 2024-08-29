import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/layout/default_app_bar.dart';
import 'package:my_forest_frontend/common/layout/default_layout.dart';
import 'package:my_forest_frontend/forest/component/forest_vertical_item_grid.dart';
import 'package:my_forest_frontend/forest/provider/forest_provider.dart';

import '../../common/const/text_styles.dart';

class SelectForestScreen extends ConsumerWidget {
  static String get routeName => "select_forest";

  const SelectForestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forests = ref.watch(forestProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '반려식물 선택하기'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '대표적인 반려식물 10가지 추천!',
                      style: MyTextStyle.bodyTitleBold,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '한 번 고른 반려 식물은 변경 불가능하니 신중히 결정해 주세요.',
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.darkGrey,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              ForestVerticalItemGrid(forests: forests),
            ],
          ),
        ),
      ),
    );
  }
}
