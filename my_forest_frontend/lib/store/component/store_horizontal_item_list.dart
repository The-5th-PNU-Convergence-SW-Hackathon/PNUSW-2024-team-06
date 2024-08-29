import 'package:flutter/material.dart';
import 'package:my_forest_frontend/store/component/product_card.dart';

import '../model/product_model.dart';

class StoreHorizontalItemList extends StatelessWidget {
  final List<ProductModel> products;

  const StoreHorizontalItemList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {},
            child: ProductCard.fromModel(
              model: product,
              itemWidth: 120.0,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16.0);
        },
      ),
    );
  }
}
