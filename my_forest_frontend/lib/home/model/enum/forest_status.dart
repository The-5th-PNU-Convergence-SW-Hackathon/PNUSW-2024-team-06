import 'package:my_forest_frontend/common/const/image_path.dart';

enum ForestStatus {
  seed("씨앗 단계"),
  germination("발아 단계"),
  sprout("새싹 단계"),
  cotyledons("떡잎 단계"),
  mainLeaf("본잎 단계"),
  stemGrowth("줄기 성장 단계"),
  leafGrowth("잎 성장 단계"),
  completion("성체 단계"),
  delivery("배송 단계");

  const ForestStatus(this.label);

  final String label;

  static String getImageUrl({
    required ForestStatus status,
  }) {
    switch (status) {
      case ForestStatus.seed:
        return "${ImagePath.forestDirectory}0.png";
      case ForestStatus.germination:
        return "${ImagePath.forestDirectory}1.png";
      case ForestStatus.sprout:
        return "${ImagePath.forestDirectory}2.png";
      case ForestStatus.cotyledons:
        return "${ImagePath.forestDirectory}3.png";
      case ForestStatus.mainLeaf:
        return "${ImagePath.forestDirectory}4.png";
      case ForestStatus.stemGrowth:
        return "${ImagePath.forestDirectory}5.png";
      case ForestStatus.leafGrowth:
        return "${ImagePath.forestDirectory}6.png";
      case ForestStatus.completion:
        return "${ImagePath.forestDirectory}7.png";
      case ForestStatus.delivery:
        return "${ImagePath.forestDirectory}8.png";
      default:
        return "${ImagePath.forestDirectory}9.png";
    }
  }

  static String getStageInfo({
    required ForestStatus status,
  }) {
    switch (status) {
      case ForestStatus.seed:
        return "0 ~ 9%";
      case ForestStatus.germination:
        return "10 ~ 19%";
      case ForestStatus.sprout:
        return "20 ~ 29%";
      case ForestStatus.cotyledons:
        return "30 ~ 44%";
      case ForestStatus.mainLeaf:
        return "45 ~ 59%";
      case ForestStatus.stemGrowth:
        return "60 ~ 74%";
      case ForestStatus.leafGrowth:
        return "75 ~ 89%";
      case ForestStatus.completion:
        return "90 ~ 99%";
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
      case >= 0 && < 9:
        return ForestStatus.seed;
      case >= 10 && < 19:
        return ForestStatus.germination;
      case >= 20 && < 29:
        return ForestStatus.sprout;
      case >= 30 && < 44:
        return ForestStatus.cotyledons;
      case >= 45 && < 59:
        return ForestStatus.mainLeaf;
      case >= 60 && < 74:
        return ForestStatus.stemGrowth;
      case >= 75 && < 89:
        return ForestStatus.leafGrowth;
      case >= 90 && < 99:
        return ForestStatus.completion;
      case >= 100:
        return ForestStatus.delivery;
      default:
        return ForestStatus.seed;
    }
  }
}
