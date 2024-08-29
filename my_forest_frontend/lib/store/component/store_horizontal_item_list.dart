import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/show/custom_general_dialog_bottom_sheet_widget.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/home/view/home_screen.dart';
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
            onTap: () {
              showCustomGeneralDialog(
                context: context,
                bottomSheetWidget: CustomGeneralDialogBottomSheetWidget(
                  title: product.title,
                  description: "반려 식물을 무럭무럭 성장시켜보세요",
                  onPressed: () {
                    context.pop();
                    showCustomGeneralDialog(
                      context: context,
                      bottomSheetWidget: CustomGeneralDialogBottomSheetWidget(
                        title: "구매완료",
                        description: "반려 식물을 성장 시키러 가볼까요?",
                        onPressed: () {
                          context.pop();
                          context.goNamed(HomeScreen.routeName);
                        },
                        buttonText: "홈으로 이동",
                      ),
                    );
                  },
                  buttonText: "구매하기",
                ),
              );
            },
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
