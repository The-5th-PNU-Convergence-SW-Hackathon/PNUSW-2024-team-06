// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../model/product_model.dart';
//
// final myItemDetailProvider = Provider.family<ProductModel, String>((ref, id) {
//   final myItem =
//       ref.watch(myItemProvider).firstWhere((element) => element.id == id);
//   return myItem;
// });
//
// final myItemProvider =
//     StateNotifierProvider<MyItemStateNotifier, List<ProductModel>>((ref) {
//   return MyItemStateNotifier();
// });
//
// class MyItemStateNotifier extends StateNotifier<List<ProductModel>> {
//   MyItemStateNotifier() : super([]);
// }
//
//
// StateProvider>
//
// final isAutoLoginProvider = StateProvider<bool>((ref) => true);

import 'package:flutter_riverpod/flutter_riverpod.dart';

final myPotProvider = StateProvider<List<int>>((ref) => [0, 1, 2]);
final mySelectedPotProvider = StateProvider<int>((ref) => 0);

final myBackgroundProvider = StateProvider<List<int>>((ref) => [0, 1, 2]);
final mySelectedBackgroundProvider = StateProvider<int>((ref) => 0);
