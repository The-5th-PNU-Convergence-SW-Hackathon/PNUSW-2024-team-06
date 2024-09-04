import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';
import 'package:my_forest_frontend/store/provider/my_item_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class MyItemScreen extends ConsumerStatefulWidget {
  static String get routeName => "my_item";

  const MyItemScreen({super.key});

  @override
  ConsumerState<MyItemScreen> createState() => _MyItemScreenState();
}

class _MyItemScreenState extends ConsumerState<MyItemScreen> {
  @override
  Widget build(BuildContext context) {
    const itemSpacing = 8.0;
    const paddingSpacing = 24.0;
    final itemWidth = (MediaQuery.of(context).size.width -
            paddingSpacing * 2 -
            itemSpacing * 2) /
        3;

    final myPots = ref.watch(myPotProvider);
    final myBackgrounds = ref.watch(myBackgroundProvider);

    final selectedPot = ref.watch(mySelectedPotProvider);
    final selectedBackground = ref.watch(mySelectedBackgroundProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '나의 아이템'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            _renderTitleAndDescription(
              title: '팟',
              description: myPots.isEmpty ? '보유하고 있는 팟이 없어요. 스토어로 가볼까요?' : "",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingSpacing),
              child: Wrap(
                runSpacing: itemSpacing,
                spacing: itemSpacing,
                children: List.generate(
                  myPots.length,
                  (int index) => SizedBox(
                    width: itemWidth,
                    child: MyPotItemCard(
                      imageUrl: "${ImagePath.potDirectory}$index.png",
                      isSelected: selectedPot == index,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            _renderTitleAndDescription(
              title: '백그라운드',
              description:
                  myBackgrounds.isEmpty ? '보유하고 있는 백그라운드가 없어요. 스토어로 가볼까요?' : "",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingSpacing),
              child: Wrap(
                runSpacing: itemSpacing,
                spacing: itemSpacing,
                children: List.generate(
                  myBackgrounds.length,
                  (int index) => SizedBox(
                    width: itemWidth,
                    child: MyBackgroundItemCard(
                      imageUrl: "${ImagePath.backgroundDirectory}$index.png",
                      isSelected: selectedPot == index,
                    ),
                  ),
                ),
              ),
            ),
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
          if (description.isNotEmpty)
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

class MyPotItemCard extends StatelessWidget {
  final String? imageUrl;
  final bool isSelected;

  const MyPotItemCard({
    super.key,
    this.imageUrl,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: MyColor.lightGrey,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: (imageUrl == null)
              ? PhosphorIcon(PhosphorIcons.plusCircle())
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        imageUrl!,
                        fit: BoxFit.cover,
                      ),
                      if (isSelected) const SizedBox(height: 8.0),
                      if (isSelected)
                        Container(
                          decoration: BoxDecoration(
                              color: MyColor.primary,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 4.0),
                            child: Text(
                              '적용 중',
                              style: MyTextStyle.descriptionMedium.copyWith(
                                color: MyColor.white,
                              ),
                            ),
                          ),
                        )
                      else
                        SizedBox(height: 36.0)
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class MyBackgroundItemCard extends StatelessWidget {
  final String? imageUrl;
  final bool isSelected;

  const MyBackgroundItemCard({
    super.key,
    this.imageUrl,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return (imageUrl == null)
        ? PhosphorIcon(PhosphorIcons.plusCircle())
        : Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
              ),
              if (isSelected)
                Positioned(
                  bottom: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      child: Text(
                        '적용 중',
                        style: MyTextStyle.descriptionMedium.copyWith(
                          color: MyColor.text,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
  }
}
