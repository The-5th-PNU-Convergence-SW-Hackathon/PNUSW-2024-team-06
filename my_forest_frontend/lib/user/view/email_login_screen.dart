import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/component/default_button.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/provider/global_provider.dart';
import '../../home/view/home_screen.dart';
import 'find_id_screen.dart';
import 'find_password_screen.dart';
import 'term_screen.dart';

class EmailLoginScreen extends StatefulWidget {
  static String get routeName => "email_login";

  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '이메일 로그인'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  ImagePath.logo,
                  width: MediaQuery.of(context).size.width * 5 / 7,
                ),
              ),
              const SizedBox(height: 60.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    hintText: "아이디",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 4.0),
                  CustomTextFormField(
                    hintText: "비밀번호",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  PrimaryButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      context.goNamed(HomeScreen.routeName);
                    },
                    child: const Text('로그인'),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const _AutoLoginButton(),
              const SizedBox(height: 40.0),
              const _BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AutoLoginButton extends ConsumerWidget {
  const _AutoLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAutoLogin = ref.watch(isAutoLoginProvider);

    return GestureDetector(
      onTap: () {
        ref.read(isAutoLoginProvider.notifier).state = !isAutoLogin;
      },
      child: Container(
        color: MyColor.empty,
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isAutoLogin
                ? PhosphorIcon(
                    PhosphorIcons.checkSquare(
                      PhosphorIconsStyle.fill,
                    ),
                    color: MyColor.primary,
                    size: 28.0,
                  )
                : PhosphorIcon(
                    PhosphorIcons.checkSquare(
                      PhosphorIconsStyle.regular,
                    ),
                    color: MyColor.middleGrey,
                    size: 28.0,
                  ),
            const SizedBox(width: 6.0),
            const Text(
              '자동 로그인',
              style: MyTextStyle.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderButton(
          title: '  회원가입  ',
          onPressed: () {
            context.goNamed(TermScreen.routeName);
          },
        ),
        renderDivider(),
        renderButton(
          title: ' 아이디 찾기',
          onPressed: () {
            context.goNamed(FindIdScreen.routeName);
          },
        ),
        renderDivider(),
        renderButton(
          title: '비밀번호 찾기',
          onPressed: () {
            context.goNamed(FindPasswordScreen.routeName);
          },
        ),
      ],
    );
  }

  Widget renderDivider() {
    return Container(
      color: MyColor.middleGrey,
      height: 16.0,
      width: 1.0,
    );
  }

  Widget renderButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: MyTextStyle.descriptionRegular.copyWith(
          color: MyColor.darkGrey,
        ),
      ),
    );
  }
}
