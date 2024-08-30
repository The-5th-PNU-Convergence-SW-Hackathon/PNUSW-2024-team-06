import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../forest/model/enum/forest_status.dart';

class GrowStageScreen extends ConsumerWidget {
  static String get routeName => "grow_stage";

  const GrowStageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '성장 단계'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40.0),
              const Text(
                '성장 단계를 살펴 보아요',
                style: MyTextStyle.bodyTitleBold,
              ),
              const SizedBox(height: 20.0),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final status = ForestStatus.values[index];

                  return _renderGrowCard(status: status);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 20.0);
                },
                itemCount: ForestStatus.values.length - 2,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
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
        Container(
          decoration: BoxDecoration(
            color: MyColor.third,
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 80.0,
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
          status.label,
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
