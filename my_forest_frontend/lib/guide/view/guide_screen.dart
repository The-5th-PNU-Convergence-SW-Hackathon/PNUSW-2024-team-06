import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/component/divider_container.dart';
import 'package:my_forest_frontend/common/const/colors.dart';

import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/horizontal_item_list.dart';
import '../component/vertical_item_grid.dart';
import '../provider/guide_provider.dart';

class GuideScreen extends ConsumerWidget {
  static String get routeName => "guide";

  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guides = ref.watch(guideProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '식물 도감'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    '나의 반려 식물',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '나의 반려 식물에 대해 알아가기',
                    style: MyTextStyle.descriptionRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            HorizontalItemList(guides: guides),
            const SizedBox(height: 40.0),
            DividerContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40.0),
                  const Text(
                    '식물 도감',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '더 많은 반려 식물을 찾아보세요',
                    style: MyTextStyle.descriptionRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            VerticalItemGrid(guides: guides),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
