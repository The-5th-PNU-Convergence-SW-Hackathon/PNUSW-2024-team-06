import 'package:my_forest_frontend/common/const/image_path.dart';

enum ForestStatus {
  seed('씨앗'),
  sprout('새싹'),
  leaf('잎'),
  adult('성체'),
  delivery('배송');

  const ForestStatus(this.label);

  final String label;

  static String getImageUrl({
    required ForestStatus status,
  }) {
    switch (status) {
      case ForestStatus.seed:
        return ImagePath.forestSeed;
      case ForestStatus.sprout:
        return ImagePath.forestSprout;
      case ForestStatus.leaf:
        return ImagePath.forestLeaf;
      case ForestStatus.adult:
        return ImagePath.forestAdult;
      case ForestStatus.delivery:
        return ImagePath.forestDelivery;
      default:
        return ImagePath.forestSeed;
    }
  }

  static String getStageInfo({
    required ForestStatus status,
  }) {
    switch (status) {
      case ForestStatus.seed:
        return "0 ~ 25%";
      case ForestStatus.sprout:
        return "26 ~ 50%";
      case ForestStatus.leaf:
        return "51 ~ 75%";
      case ForestStatus.adult:
        return "76 ~ 99%";
      case ForestStatus.delivery:
        return "100%";
      default:
        return "%";
    }
  }

  static ForestStatus getStatus({
    required int percentage,
  }) {
    switch (percentage) {
      case >= 0 && < 26:
        return ForestStatus.seed;
      case >= 26 && < 26:
        return ForestStatus.sprout;
      case >= 51 && < 26:
        return ForestStatus.leaf;
      case >= 76 && < 26:
        return ForestStatus.adult;
      case >= 100:
        return ForestStatus.delivery;
      default:
        return ForestStatus.seed;
    }
  }
}
