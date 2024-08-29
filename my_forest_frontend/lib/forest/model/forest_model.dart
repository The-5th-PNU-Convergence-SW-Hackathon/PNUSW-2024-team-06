
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
  final String effect;
  final int percentage;
  final ForestStatus status;

  ForestModel({
    required this.id,
    required this.imageUrl,
    required this.nickname,
    required this.title,
    required this.description,
    required this.effect,
    required this.percentage,
    required this.status,
  });

  ForestModel copyWith({
    String? id,
    String? imageUrl,
    String? nickname,
    String? title,
    String? description,
    String? effect,
    int? percentage,
    ForestStatus? status,
  }) {
    return ForestModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      nickname: nickname ?? this.nickname,
      title: title ?? this.title,
      description: description ?? this.description,
      effect: effect ?? this.effect,
      percentage: percentage ?? this.percentage,
      status: status ?? this.status,
    );
  }
}
