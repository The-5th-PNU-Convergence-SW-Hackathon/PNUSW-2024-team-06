import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/show/custom_general_dialog_bottom_sheet_widget.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:my_forest_frontend/forest/model/enum/forest_status.dart';
import 'package:my_forest_frontend/forest/view/select_forest_screen.dart';
import 'package:my_forest_frontend/home/view/grow_stage_screen.dart';
import 'package:my_forest_frontend/store/view/product_screen.dart';
import 'package:my_forest_frontend/user/model/user_model.dart';
import 'package:my_forest_frontend/user/provider/user_provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../forest/model/forest_model.dart';
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
    final user = ref.watch(userProvider) as UserModel;
    final ForestModel? forest = user.forest;

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
                  // right: 16.0,
                  top: 16.0,
                  child: GestureDetector(
                    onLongPress: () {
                      ref.read(userProvider.notifier).energyForest();
                    },
                    child: Image.asset(
                      ImagePath.sun,
                      width: 80.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 140.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      (forest is ForestModel)
                          ? ForestStatus.getImageUrl(
                              status: ForestStatus.getStatus(
                                  percentage: forest.percentage),
                            )
                          : ImagePath.appIcon,
                      width: 100.0,
                    ),
                  ),
                ),
                if (isWater)
                  Positioned(
                    bottom: 220.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImagePath.water,
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
                        ImagePath.heart,
                        width: 80.0,
                      ),
                    ),
                  ),
                (forest is ForestModel)
                    ? Positioned(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      Text(
                                        forest.nickname,
                                        style: MyTextStyle.bigTitleBold,
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        forest.title,
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
                                    percent: (forest.percentage > 99)
                                        ? 1.0
                                        : forest.percentage / 100,
                                    center: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (forest.percentage > 99)
                                              ? "100 %"
                                              : "${forest.percentage} %",
                                          style: MyTextStyle.bodyMedium,
                                        ),
                                        Text(
                                          ForestStatus.getStatus(
                                                  percentage: forest.percentage)
                                              .label
                                              .split(' ')
                                              .first,
                                          style: MyTextStyle.descriptionRegular
                                              .copyWith(
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
                    : Positioned(
                        bottom: 40.0,
                        child: InkWell(
                          onTap: () {
                            context.goNamed(SelectForestScreen.routeName);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '내 반려식물 선택하기',
                                    style: MyTextStyle.bodyTitleMedium,
                                  ),
                                  PhosphorIcon(
                                    PhosphorIcons.caretRight(),
                                    size: 32.0,
                                  ),
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
                            if(user.forest == null) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget:
                                CustomGeneralDialogBottomSheetWidget(
                                  title: '현재 반려중인 식물이 없습니다.',
                                  onPressed: () {
                                    context.pop();
                                    context.goNamed(SelectForestScreen.routeName);
                                  },
                                  buttonText: '반려식물 선택하기',
                                ),
                              );
                              return;
                            }

                            if (user.waterQuantity < 1) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget:
                                    CustomGeneralDialogBottomSheetWidget(
                                  title: '물방울 갯수가 소진 되었습니다.',
                                  onPressed: () {
                                    context.pop();
                                    context.goNamed(ProductScreen.routeName);
                                  },
                                  buttonText: '스토어로 이동',
                                ),
                              );
                              return;
                            }

                            isWater = true;
                            setState(() {});
                            await Future.delayed(const Duration(seconds: 3));
                            isWater = false;
                            setState(() {});

                            showCustomGeneralDialog(
                              context: context,
                              bottomSheetWidget:
                                  CustomGeneralDialogBottomSheetWidget(
                                title: '물 주기 성공!',
                                description:
                                    '하루에 한 번 물을 줄 수 있어요. 매일 물을 주면 1%씩 성장시킬 수 있어요.',
                                onPressed: () {
                                  ref.read(userProvider.notifier).water();
                                  context.pop();
                                },
                                buttonText: '확인',
                              ),
                            );
                          },
                          child: _renderItemContainer(
                            title: "물 주기",
                            quantity: user.waterQuantity,
                            count: user.waterCount,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if(user.forest == null) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget:
                                CustomGeneralDialogBottomSheetWidget(
                                  title: '현재 반려중인 식물이 없습니다.',
                                  onPressed: () {
                                    context.pop();
                                    context.goNamed(SelectForestScreen.routeName);
                                  },
                                  buttonText: '반려식물 선택하기',
                                ),
                              );
                              return;
                            }

                            if (user.heartQuantity < 1) {
                              showCustomGeneralDialog(
                                context: context,
                                bottomSheetWidget:
                                    CustomGeneralDialogBottomSheetWidget(
                                  title: '영양분 갯수가 소진 되었습니다.',
                                  onPressed: () {
                                    context.pop();
                                    context.goNamed(ProductScreen.routeName);
                                  },
                                  buttonText: '스토어로 이동',
                                ),
                              );
                              return;
                            }

                            isHeart = true;
                            setState(() {});
                            await Future.delayed(const Duration(seconds: 3));
                            isHeart = false;
                            setState(() {});

                            showCustomGeneralDialog(
                              context: context,
                              bottomSheetWidget:
                                  CustomGeneralDialogBottomSheetWidget(
                                title: '영양분 주기 성공!',
                                description:
                                    '하루에 한 번 영양분을 줄 수 있어요. 매일 영양분을 주면 2%씩 성장시킬 수 있어요.',
                                onPressed: () {
                                  ref.read(userProvider.notifier).heart();
                                  context.pop();
                                },
                                buttonText: '확인',
                              ),
                            );
                          },
                          child: _renderItemContainer(
                            title: '영양분 주기',
                            quantity: user.heartQuantity,
                            count: user.heartCount,
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
          color: const Color(0xFFC4F1FF),
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
              title == "물 주기"
                  ? ImagePath.water
                  : ImagePath.heart,
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
                  "$quantity 개",
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
