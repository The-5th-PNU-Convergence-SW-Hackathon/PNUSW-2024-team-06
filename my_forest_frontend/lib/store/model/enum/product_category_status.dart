import 'package:my_forest_frontend/common/const/image_path.dart';

enum ProductCategoryStatus {
  water('물'),
  heart('영양분'),
  pot('팟'),
  background('백그라운드');

  const ProductCategoryStatus(this.label);

  final String label;

  static String getImageUrl({
    required int index,
  }) {
    switch (index) {
      case < 4:
        return '${ImagePath.productDirectory}water.png';
      case >= 4 && < 8:
        return '${ImagePath.productDirectory}heart.png';
      case >= 8 && < 16:
        return '${ImagePath.productDirectory}$index.png';
      case >= 16 && < 22:
        return '${ImagePath.productDirectory}$index.png';
      default:
        return '${ImagePath.productDirectory}water.png';
    }
  }

  static ProductCategoryStatus getCategory({
    required int index,
  }) {
    switch (index) {
      case < 4:
        return ProductCategoryStatus.water;
      case >= 4 && < 8:
        return ProductCategoryStatus.heart;

      case >= 8 && < 16:
        return ProductCategoryStatus.pot;

      case >= 16 && < 22:
        return ProductCategoryStatus.background;
      default:
        return ProductCategoryStatus.water;
    }
  }
}
