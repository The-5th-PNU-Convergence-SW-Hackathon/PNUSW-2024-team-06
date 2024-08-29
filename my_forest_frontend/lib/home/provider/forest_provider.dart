import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/home/model/forest_model.dart';

final forestProvider =
    StateNotifierProvider<ForestStateNotifier, ForestModelBase>(
  (ref) => ForestStateNotifier(),
);

class ForestStateNotifier extends StateNotifier<ForestModelBase> {
  ForestStateNotifier() : super(ForestModelLoading());
}
