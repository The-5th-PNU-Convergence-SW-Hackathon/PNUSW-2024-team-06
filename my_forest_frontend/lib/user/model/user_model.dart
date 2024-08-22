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
    List<String>? recentlyViewedItems,
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
    );
  }
}
