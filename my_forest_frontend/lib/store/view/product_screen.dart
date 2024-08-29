import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/store/component/store_horizontal_item_list.dart';

import '../../common/component/show/custom_general_dialog_bottom_sheet_widget.dart';
import '../../common/component/show/show_custom_general_dialog.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../home/view/home_screen.dart';
import '../provider/product_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);
    final waters = products.sublist(0, 4);
    final hearts = products.sublist(4, 8);

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '스토어'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderTitleAndDescription(
              title: '물',
              description: '반려식물이 더 빨리 자라도록 많은 물을 주세요',
            ),
            StoreHorizontalItemList(
              products: waters,
              onPurchasePress: () async {
                context.pop();
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 1));
                setState(() {
                  isLoading = false;
                });

                showCustomGeneralDialog(
                  context: context,
                  bottomSheetWidget: CustomGeneralDialogBottomSheetWidget(
                    title: "구매완료",
                    description: "반려 식물에게 물을 주러 가볼까요?",
                    onPressed: () {
                      context.pop();
                      context.goNamed(HomeScreen.routeName);
                    },
                    buttonText: "물 주러 가기",
                  ),
                );
              },
            ),
            const SizedBox(height: 40.0),
            _renderTitleAndDescription(
              title: '영양분',
              description: '반려식물이 더 빨리 자라도록 많은 영양분을 주세요',
            ),
            StoreHorizontalItemList(
              products: hearts,
              onPurchasePress: () async {
                context.pop();
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 1));
                setState(() {
                  isLoading = false;
                });

                showCustomGeneralDialog(
                  context: context,
                  bottomSheetWidget: CustomGeneralDialogBottomSheetWidget(
                    title: "구매완료",
                    description: "반려 식물에게 영양분을 주러 가볼까요?",
                    onPressed: () {
                      context.pop();
                      context.goNamed(HomeScreen.routeName);
                    },
                    buttonText: "영양분 주러가기",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: MyTextStyle.bodyTitleBold,
          ),
          Text(
            description,
            style: MyTextStyle.descriptionRegular.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
