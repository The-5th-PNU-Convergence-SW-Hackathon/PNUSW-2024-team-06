import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../provider/notification_provider.dart';

class NotificationDetailScreen extends ConsumerWidget {
  static String get routeName => "notification_detail";

  final String id;

  const NotificationDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.read(notificationDetailProvider(id))!;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40.0),
              Text(
                notification.title,
                style: MyTextStyle.bigTitleBold,
              ),
              const SizedBox(height: 8.0),
              Text(
                DataUtils.convertDateTimeToDateTimeString(
                  datetime: notification.createAt,
                ),
                style: MyTextStyle.bodyRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                notification.description,
                style: MyTextStyle.bodyRegular,
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
