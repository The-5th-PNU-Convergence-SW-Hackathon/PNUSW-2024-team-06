import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/enum/forest_status.dart';
import '../model/forest_model.dart';

final forestProvider =
    StateNotifierProvider<ForestStateNotifier, ForestModelBase>(
  (ref) => ForestStateNotifier(),
);

class ForestStateNotifier extends StateNotifier<ForestModelBase> {
  ForestStateNotifier() : super(ForestModelLoading());

  void updateStatus({required ForestStatus forestStatus}) {
    if (state is ForestModel) {
      state = (state as ForestModel).copyWith(
        status: forestStatus,
      );
    }
  }
}
