import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/user/view/term_detail_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/divider_container.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../forest/component/delivery_status_container.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '마이페이지',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(EditProfileScreen.routeName);
              },
              icon: PhosphorIcon(
                PhosphorIcons.gear(),
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            if (user is UserModel)
              renderProfileTitle(
                context: context,
                user: user,
              ),
            const DividerContainer(topHeight: 32.0, bottomHeight: 20.0),
            const DeliveryStatusContainer(),
            const SizedBox(height: 20.0),
            renderIconAndTextButton(
              title: '이용약관',
              onTap: () {
                context.pushNamed(
                  TermDetailScreen.routeName,
                  pathParameters: {'id': '0'},
                );
              },
            ),
            renderIconAndTextButton(
              title: '개인정보 처리방침',
              onTap: () {
                context.pushNamed(
                  TermDetailScreen.routeName,
                  pathParameters: {'id': '1'},
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProfileTitle({
    required BuildContext context,
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.user,
            height: 72.0,
            width: 72.0,
          ),
          const SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: MyTextStyle.bigTitleRegular,
              ),
              const SizedBox(height: 4.0),
              Text(
                user.username,
                style: MyTextStyle.bodyRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderIconAndTextButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: MyTextStyle.bodyTitleMedium,
              ),
              PhosphorIcon(
                PhosphorIcons.caretRight(),
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
