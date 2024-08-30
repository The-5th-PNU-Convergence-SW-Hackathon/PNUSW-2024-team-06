import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';

import '../../common/const/data.dart';
import '../model/guide_model.dart';

final guideDetailProvider = Provider.family<GuideModel, String>((ref, id) {
  final events = ref.watch(guideProvider);

  return events.firstWhere((element) => element.id == id);
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
    final forests = forestData.keys;

    state = List.generate(
      forests.length,
      (index) => GuideModel(
        id: index.toString(),
        imageUrl: "${ImagePath.forestDirectory}$index.png",
        title: forests.elementAt(index),
        description:
            '⏺ 특징: ${forestData[forests.elementAt(index)]![0]}\n⏺ 효능: ${forestData[forests.elementAt(index)]![1]}',
        engTitle: guideEngTitle.elementAt(index),
      ),
    );
  }
}
