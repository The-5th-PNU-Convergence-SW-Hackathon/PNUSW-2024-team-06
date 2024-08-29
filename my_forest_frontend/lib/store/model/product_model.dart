import '../../user/model/user_model.dart';
import 'enum/product_category_status.dart';

class ProductModel {
  final String id;
  final String title;
  final int price;
  final String mainImageUrl;
  final DateTime createdAt;
  final ProductCategoryStatus categoryStatus;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.mainImageUrl,
    required this.createdAt,
    required this.categoryStatus,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    int? price,
    String? mainImageUrl,
    DateTime? createdAt,
    ProductCategoryStatus? categoryStatus,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      createdAt: createdAt ?? this.createdAt,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }
}
