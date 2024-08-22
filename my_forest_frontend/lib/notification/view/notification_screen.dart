import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../provider/notification_provider.dart';
import 'notification_detail_screen.dart';

class NotificationScreen extends ConsumerWidget {
  static String get routeName => "notification";

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationProvider);


    return DefaultLayout(
      appbar: const DefaultAppBar(title: '공지사항'),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        itemBuilder: (BuildContext context, int index) {
          final notification = notifications[index];
          return InkWell(
            onTap: () {
              context.pushNamed(
                NotificationDetailScreen.routeName,
                pathParameters: {
                  "id": notification.id,
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    notification.title,
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    DataUtils.convertDateTimeToDateTimeString(
                      datetime: notification.createAt,
                    ),
                    style: MyTextStyle.bodyRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return Container(
            height: 1.0,
            color: MyColor.middleGrey,
          );
        },
        itemCount: notifications.length,
      ),
    );
  }
}
