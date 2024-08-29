import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final int price;
  final String mainImageUrl;
  final DateTime createdAt;

  // widget property
  final String? heroKey; // 히어로 위젯 키
  final double? itemWidth;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.mainImageUrl,
    required this.createdAt,
    this.heroKey,
    this.itemWidth,
  });

  factory ProductCard.fromModel({
    required ProductModel model,
    bool isSale = true,
    double? itemWidth,
  }) {
    return ProductCard(
      heroKey: model.id,
      id: model.id,
      title: model.title,
      price: model.price,
      mainImageUrl: model.mainImageUrl,
      createdAt: model.createdAt,
      itemWidth: itemWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth ?? 156.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            mainImageUrl,
            fit: BoxFit.cover,
            height: itemWidth ?? 156.0,
          ),
          const SizedBox(height: 6.0),
          Text(
            title,
            style: MyTextStyle.descriptionMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4.0),
          Text(
            '${DataUtils.convertPriceToMoneyString(price: price)} 원',
            style: MyTextStyle.bodyBold,
          ),
        ],
      ),
    );
  }
}
