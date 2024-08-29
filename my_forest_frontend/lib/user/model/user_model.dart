import 'package:my_forest_frontend/forest/model/forest_model.dart';

import 'address_model.dart';

abstract class UserModelBase {}

class UserModelLoading extends UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({
    required this.message,
  });
}

class UserModel extends UserModelBase {
  final int id; // primary key
  final String email;
  final String username;
  final String nickname;
  final String password;
  final String name;
  final String phone;
  final String profileImage;
  final AddressModel address;
  final int waterQuantity;
  final int waterCount;
  final int heartQuantity;
  final int heartCount;
  final ForestModel? forest;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.nickname,
    required this.password,
    required this.name,
    required this.phone,
    required this.profileImage,
    required this.address,
    required this.waterQuantity,
    required this.waterCount,
    required this.heartQuantity,
    required this.heartCount,
    this.forest,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? username,
    String? nickname,
    String? password,
    String? name,
    String? phone,
    String? profileImage,
    AddressModel? address,
    int? waterQuantity,
    int? waterCount,
    int? heartQuantity,
    int? heartCount,
    ForestModel? forest,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      waterQuantity: waterQuantity ?? this.waterQuantity,
      waterCount: waterCount ?? this.waterCount,
      heartQuantity: heartQuantity ?? this.heartQuantity,
      heartCount: heartCount ?? this.heartCount,
      forest: forest ?? this.forest,
    );
  }
}
