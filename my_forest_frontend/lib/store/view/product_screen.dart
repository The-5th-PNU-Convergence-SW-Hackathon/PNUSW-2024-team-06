import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/store/component/store_horizontal_item_list.dart';

import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../provider/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final waters = products.sublist(0, 4);
    final hearts = products.sublist(4, 8);
    final pots = products.sublist(8, 16);
    final backgrounds = products.sublist(16, 22);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '스토어'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderTitleAndDescription(
              title: '물',
              description: '반려식물이 더 빨리 자라도록 많은 물을 주세요',
            ),
            StoreHorizontalItemList(products: waters),
            const SizedBox(height: 40.0),
            _renderTitleAndDescription(
              title: '영양분',
              description: '반려식물이 더 빨리 자라도록 많은 영양분을 주세요',
            ),
            StoreHorizontalItemList(products: hearts),
            const SizedBox(height: 40.0),
            _renderTitleAndDescription(
              title: '팟',
              description: '내 반려식물과 어울리는 팟을 골라보세요.\n배송 시 최종 구매 팟 디자인으로 배송돼요.',
            ),
            StoreHorizontalItemList(products: pots),
            const SizedBox(height: 40.0),
            _renderTitleAndDescription(
              title: '백그라운드',
              description: '나의 취향대로 반려식물의 백그라운드를 설정해보세요',
            ),
            StoreHorizontalItemList(products: backgrounds),
            const SizedBox(height: 40.0),
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
