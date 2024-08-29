import '../../user/model/user_model.dart';
import 'enum/product_category_status.dart';

class ProductModel {
  final String id;
  final String title;
  final int price;
  final int quantity;
  final String mainImageUrl;
  final DateTime createdAt;
  final ProductCategoryStatus categoryStatus;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.mainImageUrl,
    required this.createdAt,
    required this.categoryStatus,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    int? price,
    int? quantity,
    String? mainImageUrl,
    DateTime? createdAt,
    ProductCategoryStatus? categoryStatus,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      createdAt: createdAt ?? this.createdAt,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }
}
