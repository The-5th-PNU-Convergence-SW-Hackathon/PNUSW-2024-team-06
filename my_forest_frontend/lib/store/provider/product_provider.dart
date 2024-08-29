import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/data.dart';
import '../../common/utils/data_utils.dart';
import '../model/enum/product_category_status.dart';
import '../model/product_model.dart';

final productDetailProvider = Provider.family<ProductModel, String>((ref, id) {
  final product =
      ref.watch(productProvider).firstWhere((element) => element.id == id);
  return product;
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super([]) {
    state = getItems();
  }

  List<ProductModel> getItems() {
    final now = DateTime.now();
    final createdAt = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final products = productItems;

    return List.generate(
      products.length,
      (index) => ProductModel(
        id: index.toString(),
        title: products.keys.toList()[index],
        price: products.values.toList()[index].first,
        quantity: products.values.toList()[index].last,
        mainImageUrl: ProductCategoryStatus.getImageUrl(index: index),
        createdAt: createdAt.subtract(Duration(
          days: DataUtils.getRandomDouble(min: 1.0, range: 10).toInt(),
        )),
        categoryStatus: ProductCategoryStatus.getCategory(index: index),
      ),
    );
  }
}
