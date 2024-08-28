import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:my_forest_frontend/home/model/enum/forest_status.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class GrowStageScreen extends ConsumerWidget {
  static String get routeName => "grow_stage";

  const GrowStageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '성장 단계'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              '성장 단계를 살펴 보아요',
              style: MyTextStyle.bigTitleBold,
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final status = ForestStatus.values[index];

                  return _renderGrowCard(status: status);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20.0);
                },
                itemCount: ForestStatus.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderGrowCard({
    required ForestStatus status,
  }) {
    final imageUrl = ForestStatus.getImageUrl(status: status);
    final stageInfo = ForestStatus.getStageInfo(status: status);

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: MyColor.secondary,
          radius: 40.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              imageUrl,
              width: 60.0,
            ),
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          "${status.label} 단계",
          style: MyTextStyle.bodyMedium,
        ),
        const Expanded(child: SizedBox(width: 1.0)),
        Text(
          stageInfo,
          style: MyTextStyle.bodyRegular.copyWith(
            color: MyColor.darkGrey,
          ),
        ),
      ],
    );
  }
}
