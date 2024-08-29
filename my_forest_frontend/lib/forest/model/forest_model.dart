
import 'enum/forest_status.dart';

abstract class ForestModelBase {}

class ForestModelLoading extends ForestModelBase {}

class ForestModelError extends ForestModelBase {
  final String message;

  ForestModelError({
    required this.message,
  });
}

class ForestModel extends ForestModelBase {
  final String id;
  final String imageUrl;
  final String nickname;
  final String title;
  final String description;
  final ForestStatus status;

  ForestModel({
    required this.id,
    required this.imageUrl,
    required this.nickname,
    required this.title,
    required this.description,
    required this.status,
  });

  ForestModel copyWith({
    String? id,
    String? imageUrl,
    String? nickname,
    String? title,
    String? description,
    ForestStatus? status,
  }) {
    return ForestModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      nickname: nickname ?? this.nickname,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
