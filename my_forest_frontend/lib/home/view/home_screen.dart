import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/default_button.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:my_forest_frontend/home/provider/water_heart_provider.dart';
import 'package:my_forest_frontend/home/view/grow_stage_screen.dart';
import 'package:my_forest_frontend/store/view/product_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../notification/view/notification_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isWater = false;
  bool isHeart = false;

  @override
  Widget build(BuildContext context) {
    final waterQuantity = ref.watch(waterQuantityProvider);
    final waterCount = ref.watch(waterCountProvider);
    final heartQuantity = ref.watch(heartQuantityProvider);
    final heartCount = ref.watch(heartCountProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(ImagePath.logo),
        ),
        leadingWidth: 160,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(NotificationScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.bell(),
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.topCenter,
              children: [
                _renderBackgroundContainer(),
                Positioned(
                  right: 16.0,
                  top: 16.0,
                  child: Image.asset(
                    ImagePath.sun,
                    width: 80.0,
                  ),
                ),
                Positioned(
                  bottom: 140.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      ImagePath.appIcon,
                      width: 80.0,
                    ),
                  ),
                ),
                if (isWater)
                  Positioned(
                    bottom: 220.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImagePath.animationWater,
                        width: 80.0,
                      ),
                    ),
                  ),
                if (isHeart)
                  Positioned(
                    bottom: 220.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImagePath.animationHeart,
                        width: 80.0,
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 20.0,
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(GrowStageScreen.routeName);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 48,
                      decoration: BoxDecoration(
                          color: MyColor.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '초록이',
                                  style: MyTextStyle.bigTitleBold,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '몬스테라 Monstera',
                                  style: MyTextStyle.bodyRegular.copyWith(
                                    color: MyColor.darkGrey,
                                  ),
                                ),
                              ],
                            ),
                            CircularPercentIndicator(
                              backgroundColor: MyColor.middleGrey,
                              radius: 40.0,
                              lineWidth: 5.0,
                              percent: 0.26,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "26%",
                                    style: MyTextStyle.bodyMedium,
                                  ),
                                  Text(
                                    "새싹",
                                    style:
                                        MyTextStyle.descriptionRegular.copyWith(
                                      color: MyColor.darkGrey,
                                    ),
                                  ),
                                ],
                              ),
                              progressColor: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '쑥쑥 성장시키기',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '나만의 반려 식물을 쑥쑥 성장 시켜 보세요!',
                    style: MyTextStyle.descriptionRegular
                        .copyWith(color: MyColor.darkGrey),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (waterQuantity < 1) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget: Container(
                                  height: 180.0,
                                  color: MyColor.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0, horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          '물방울 갯수가 소진 되었습니다.',
                                          style: MyTextStyle.bodyTitleBold,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20.0),
                                        SecondaryButton(
                                          onPressed: () {
                                            context.pop();
                                            context.goNamed(
                                                ProductScreen.routeName);
                                          },
                                          child: const Text('스토어로 이동'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              return;
                            }

                            isWater = true;
                            setState(() {});
                            await Future.delayed(const Duration(seconds: 5));
                            isWater = false;
                            setState(() {});

                            showCustomGeneralDialog(
                              context: context,
                              bottomSheetWidget: Container(
                                height: 248.0,
                                color: MyColor.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Text(
                                        '물 주기 성공!',
                                        style: MyTextStyle.bigTitleBold,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20.0),
                                      Expanded(
                                        child: Text(
                                          '하루에 한 번 물을 줄 수 있어요.\n매일 물을 주면 0.5%씩 성장시킬 수 있어요.',
                                          style: MyTextStyle.descriptionRegular
                                              .copyWith(
                                            color: MyColor.darkGrey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      SecondaryButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text('확인'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: _renderItemContainer(
                            title: "물 주기",
                            quantity: waterQuantity,
                            count: waterCount,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (heartQuantity < 1) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget: Container(
                                  height: 180.0,
                                  color: MyColor.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0, horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          '영양분 갯수가 소진 되었습니다.',
                                          style: MyTextStyle.bodyTitleBold,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20.0),
                                        SecondaryButton(
                                          onPressed: () {
                                            context.pop();
                                            context.goNamed(
                                                ProductScreen.routeName);
                                          },
                                          child: const Text('스토어로 이동'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              return;
                            }

                            isHeart = true;
                            setState(() {});
                            await Future.delayed(const Duration(seconds: 5));
                            isHeart = false;
                            setState(() {});

                            showCustomGeneralDialog(
                              context: context,
                              bottomSheetWidget: Container(
                                height: 248.0,
                                color: MyColor.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Text(
                                        '영양분 주기 성공!',
                                        style: MyTextStyle.bigTitleBold,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20.0),
                                      Expanded(
                                        child: Text(
                                          '하루에 한 번 영양분을 줄 수 있어요.\n매일 영양분을 주면 1%씩 성장시킬 수 있어요.',
                                          style: MyTextStyle.descriptionRegular
                                              .copyWith(
                                            color: MyColor.darkGrey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      SecondaryButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text('확인'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: _renderItemContainer(
                            title: '영양분 주기',
                            quantity: heartQuantity,
                            count: heartCount,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderBackgroundContainer() {
    return Column(
      children: [
        Container(
          color: const Color(0xFFDEF7FF),
          width: double.infinity,
          height: 140.0,
        ),
        Container(
          color: MyColor.third,
          width: double.infinity,
          height: 20.0,
        ),
        Container(
          color: MyColor.secondary,
          width: double.infinity,
          height: 20.0,
        ),
        Container(
          color: MyColor.primary,
          width: double.infinity,
          height: 160.0,
        ),
      ],
    );
  }

  Widget _renderItemContainer({
    required String title,
    required int quantity,
    required int count,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: MyColor.secondary,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: MyTextStyle.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Image.asset(
              title == "물 주기" ? ImagePath.water : ImagePath.heart,
              height: 50.0,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(width: 12.0),
                Text(
                  title == "물 주기" ? '내 물방울' : "내 영양분",
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                Text(
                  "$quantity 번",
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(width: 12.0),
                Text(
                  "오늘 준 횟수",
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                Text(
                  "$count 번",
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
