import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_layout.dart';
import 'custom_sns_screen.dart';
import 'email_login_screen.dart';

class LoginScreen extends StatelessWidget {
  static String get routeName => "login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                ImagePath.logo,
                width: MediaQuery.of(context).size.width * 5 / 7,
              ),
            ),
            const SizedBox(height: 80.0),
            _renderKakaoButton(onPressed: () {
              context.goNamed(
                CustomSnsScreen.routeName,
                pathParameters: {'title': 'kakao'},
              );
            }),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    context.goNamed(
                      CustomSnsScreen.routeName,
                      pathParameters: {'title': 'naver'},
                    );
                  },
                  icon: Image.asset(
                    ImagePath.naverIcon,
                    width: 72.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.goNamed(
                      CustomSnsScreen.routeName,
                      pathParameters: {'title': 'google'},
                    );
                  },
                  icon: Image.asset(
                    ImagePath.googleIcon,
                    width: 72.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.goNamed(
                      CustomSnsScreen.routeName,
                      pathParameters: {'title': 'apple'},
                    );
                  },
                  icon: Image.asset(
                    ImagePath.appleIcon,
                    width: 72.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            TextButton(
              onPressed: () {
                context.goNamed(EmailLoginScreen.routeName);
              },
              child: Text(
                '이메일로 로그인',
                style: MyTextStyle.bodyRegular.copyWith(
                  color: MyColor.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderKakaoButton({
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: MyColor.text,
        backgroundColor: const Color(0xFFFAE64D),
        elevation: 0,
        minimumSize: const Size(100, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: MyTextStyle.bodyBold.copyWith(
          color: MyColor.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              ImagePath.kakaoIcon,
              width: 18.0,
              height: 18.0,
            ),
          ),
          const Text(
            '카카오로 3초만에 시작하기',
            style: MyTextStyle.bodyMedium,
          ),
          const SizedBox(width: 1.0),
        ],
      ),
    );
  }
}
