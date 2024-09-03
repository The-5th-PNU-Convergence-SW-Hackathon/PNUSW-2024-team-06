import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final int price;
  final int quantity;
  final String mainImageUrl;
  final DateTime createdAt;

  // widget property
  final String? heroKey; // 히어로 위젯 키

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.mainImageUrl,
    required this.createdAt,
    this.heroKey,
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
      quantity: model.quantity,
      mainImageUrl: model.mainImageUrl,
      createdAt: model.createdAt,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColor.lightGrey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  Image.asset(
                    mainImageUrl,
                    fit: BoxFit.fill,
                    width: 40.0,
                    height: 40.0,
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    "x  ${quantity.toString()}",
                    style: MyTextStyle.bodyRegular,
                  ),
                  const SizedBox(height: 6.0),
                ],
              ),
            ),
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
