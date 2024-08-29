import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../../forest/model/forest_model.dart';
import '../model/address_model.dart';
import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModelBase> {
  UserStateNotifier() : super(UserModelLoading()) {
    initItems();
  }

  void updateInfo({
    required String name,
    required String phone,
    required String address,
    required String detailAddress,
    required String memo,
  }) {
    state = (state as UserModel).copyWith(
      name: name,
      phone: phone,
      address: AddressModel(
        address: address,
        detailAddress: detailAddress,
        memo: memo,
      ),
    );
  }

  void updateWaterQuantity({required int waterQuantity}) {
    state = (state as UserModel).copyWith(
      waterQuantity: waterQuantity,
    );
  }

  void updateHeartQuantity({required int heartQuantity}) {
    state = (state as UserModel).copyWith(
      heartQuantity: heartQuantity,
    );
  }

  void water() {
    final user = state as UserModel;

    state = user.copyWith(
      waterCount: user.waterCount + 1,
      waterQuantity: user.waterQuantity - 1,
      forest: user.forest?.copyWith(
        percentage: user.forest!.percentage + 1,
      ),
    );
  }

  void heart() {
    final user = state as UserModel;

    state = user.copyWith(
      heartCount: user.heartCount + 1,
      heartQuantity: user.heartQuantity - 1,
      forest: user.forest?.copyWith(
        percentage: user.forest!.percentage + 2,
      ),
    );
  }

  void addForest({
    required ForestModel forest,
  }) {
    state = (state as UserModel).copyWith(
      forest: forest,
    );
  }

  void initItems() {
    state = defaultUserModel;
  }
}
