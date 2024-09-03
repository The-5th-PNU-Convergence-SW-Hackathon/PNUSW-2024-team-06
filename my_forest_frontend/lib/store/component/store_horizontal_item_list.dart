import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/component/show/custom_general_dialog_bottom_sheet_widget.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/store/component/product_card.dart';
import 'package:my_forest_frontend/user/model/user_model.dart';
import 'package:my_forest_frontend/user/provider/user_provider.dart';

import '../model/product_model.dart';

class StoreHorizontalItemList extends ConsumerWidget {
  final List<ProductModel> products;
  final VoidCallback onPurchasePress;

  const StoreHorizontalItemList({
    super.key,
    required this.products,
    required this.onPurchasePress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider) as UserModel;

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
            onTap: () {
              showCustomGeneralDialog(
                context: context,
                bottomSheetWidget: CustomGeneralDialogBottomSheetWidget(
                  title: product.title,
                  description: "반려 식물을 무럭무럭 성장시켜보세요",
                  onPressed: onPurchasePress,
                  buttonText: "구매하기",
                ),
              );

              if (product.title.contains("물")) {
                ref.read(userProvider.notifier).updateWaterQuantity(
                      waterQuantity: user.waterQuantity + product.quantity,
                    );
              } else {
                ref.read(userProvider.notifier).updateHeartQuantity(
                      heartQuantity: user.heartQuantity + product.quantity,
                    );
              }
            },
            child: ProductCard.fromModel(model: product),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8.0);
        },
      ),
    );
  }
}
