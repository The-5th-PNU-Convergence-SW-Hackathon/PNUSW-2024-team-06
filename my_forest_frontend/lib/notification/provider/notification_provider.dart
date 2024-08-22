import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../../common/utils/data_utils.dart';
import '../model/notification_model.dart';

final notificationDetailProvider =
    Provider.family<NotificationModel?, String>((ref, id) {
  final events = ref.watch(notificationProvider);

  return events.where((element) => element.id == id).firstOrNull;
});

final notificationProvider =
    StateNotifierProvider<NotificationStateNotifier, List<NotificationModel>>(
  (ref) => NotificationStateNotifier(),
);

class NotificationStateNotifier extends StateNotifier<List<NotificationModel>> {
  NotificationStateNotifier() : super([]) {
    initItems();
  }

  void initItems() {
    final notifications = notificationData.keys
        .mapIndexed(
          (index, element) => NotificationModel(
            id: index.toString(),
            title: element,
            description: notificationData[element]!,
            createAt: DataUtils.getRandomDateTime(dividerAt: DateTime.now()),
          ),
        )
        .toList();

    state = notifications.sorted((a, b) => b.createAt.compareTo(a.createAt));
  }
}
