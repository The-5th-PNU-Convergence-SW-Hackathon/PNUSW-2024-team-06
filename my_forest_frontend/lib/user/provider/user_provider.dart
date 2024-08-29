import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
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

  void initItems() {
    state = defaultUserModel;
  }
}
