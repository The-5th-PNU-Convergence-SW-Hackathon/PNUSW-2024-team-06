import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/data.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';

import '../model/forest_model.dart';

final forestDetailProvider = Provider.family<ForestModel, String>((ref, id) {
  final events = ref.watch(forestProvider);

  return events.firstWhere((element) => element.id == id);
});

final forestProvider =
StateNotifierProvider<ForestStateNotifier, List<ForestModel>>(
  (ref) => ForestStateNotifier(),
);

class ForestStateNotifier extends StateNotifier<List<ForestModel>> {
  ForestStateNotifier() : super([]) {
    initItems();
  }

  void initItems() {
    final forests = forestData.keys;

    state = List.generate(
      forests.length,
      (index) => ForestModel(
        id: index.toString(),
        imageUrl: "${ImagePath.forestDirectory}$index.png",
        nickname: '',
        title: forests.elementAt(index),
        engTitle: guideEngTitle[index],
        description: forestData[forests.elementAt(index)]![0],
        effect: forestData[forests.elementAt(index)]![1],
        percentage: 0,
      ),
    );
  }
}
