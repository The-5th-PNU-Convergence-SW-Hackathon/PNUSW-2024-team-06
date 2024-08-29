import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/forest/view/delivery_screen.dart';

import '../../common/component/default_button.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/enum/forest_status.dart';
import '../provider/forest_provider.dart';

class DeliveryStatusContainer extends ConsumerWidget {
  const DeliveryStatusContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forest = ref.watch(forestProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColor.middleGrey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '반려식물 상태',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Image.asset(
                    ForestStatus.getImageUrl(status: ForestStatus.delivery),
                    width: 72.0,
                    height: 72.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    ForestStatus.getStatus(percentage: 1000).label,
                    style: MyTextStyle.bodyRegular,
                  ),
                  const Expanded(child: SizedBox(width: 1.0)),
                  SecondaryButton(
                    onPressed: () {
                      context.goNamed(DeliveryScreen.routeName);
                    },
                    child: const Text('배송하기'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
