import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../notification/view/notification_screen.dart';

class HomeScreen extends ConsumerWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    ImagePath.homeSun,
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
                Positioned(
                  bottom: 20.0,
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
                        child: _renderItemContainer(
                            title: 'asdfasdf', iconUrl: 'qwerqwer'),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: _renderItemContainer(
                            title: 'asdfasdf', iconUrl: 'qwerqwer'),
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
          color: const Color(0xFFDFF5DB),
          width: double.infinity,
          height: 20.0,
        ),
        Container(
          color: const Color(0xFFC7EAC4),
          width: double.infinity,
          height: 20.0,
        ),
        Container(
          color: const Color(0xFF96C598),
          width: double.infinity,
          height: 160.0,
        ),
      ],
    );
  }

  Widget _renderItemContainer({
    required String title,
    required String iconUrl,
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
            const Text(
              '물 주기',
              style: MyTextStyle.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            PhosphorIcon(
              PhosphorIcons.heart(),
              size: 40.0,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const SizedBox(width: 12.0),
                Text(
                  '내 물방울',
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                Text(
                  '1개',
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
                  '오늘 물 주기',
                  style: MyTextStyle.descriptionRegular.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                Text(
                  '100번',
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
