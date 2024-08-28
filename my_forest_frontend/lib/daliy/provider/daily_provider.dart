import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../model/daily_model.dart';

final dailyDetailProvider = Provider.family<DailyModel, String>((ref, id) {
  final events = ref.watch(dailyProvider);

  return events.firstWhere((element) => element.id == id);
});

final dailyProvider =
    StateNotifierProvider<DailyStateNotifier, List<DailyModel>>(
  (ref) => DailyStateNotifier(),
);

class DailyStateNotifier extends StateNotifier<List<DailyModel>> {
  DailyStateNotifier() : super([]) {
    initItems();
  }

  void updateItem({
    required String id,
    required String answer,
    required String emotionImageUrl,
  }) {
    state = state.map((element) {
      if (element.id == id) {
        return element.copyWith(
          id: id,
          answer: answer,
          emotionImageUrl: emotionImageUrl,
        );
      } else {
        return element;
      }
    }).toList();
  }

  void initItems() {
    state = dailyQuestions
        .mapIndexed(
          (index, element) => DailyModel(
            id: index.toString(),
            question: element,
            answer: '',
            emotionImageUrl: '',
          ),
        )
        .toList();
  }
}
