import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/data.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';

import '../model/guide_model.dart';

final guideDetailProvider = Provider.family<GuideModel?, String>((ref, id) {
  final events = ref.watch(guideProvider);

  return events.where((element) => element.id == id).firstOrNull;
});

final guideProvider =
    StateNotifierProvider<GuideStateNotifier, List<GuideModel>>(
  (ref) => GuideStateNotifier(),
);

class GuideStateNotifier extends StateNotifier<List<GuideModel>> {
  GuideStateNotifier() : super([]) {
    initItems();
  }

  void initItems() {
    state = guideTitles.keys
        .mapIndexed(
          (index, element) => GuideModel(
            id: index.toString(),
            imageUrl: '${ImagePath.guideDirectory}0.png',
            title: element,
            engTitle: guideTitles[element]!,
            description: guideDescriptions[index],
          ),
        )
        .toList();
  }
}
