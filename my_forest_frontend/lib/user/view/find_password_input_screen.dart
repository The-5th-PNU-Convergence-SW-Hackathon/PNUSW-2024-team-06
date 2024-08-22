import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/component/default_button.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/completion_screen_to_email_login.dart';

class FindPasswordInputScreen extends ConsumerStatefulWidget {
  static String get routeName => 'find_password_input';

  const FindPasswordInputScreen({super.key});

  @override
  ConsumerState<FindPasswordInputScreen> createState() =>
      _FindPasswordInputScreenState();
}

class _FindPasswordInputScreenState
    extends ConsumerState<FindPasswordInputScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '비밀번호 찾기'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              isLoading = false;
            });

            context.goNamed(
              CompletionScreenToEmailLogin.routeName,
              pathParameters: {
                'title': '비밀번호가\n정상적으로\n변경되었습니다.',
              },
            );
          },
          child: const Text('비밀번호 변경'),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                '새로운 비밀번호를\n입력해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 40.0),
              CustomTextFormField(
                hintText: '비밀번호(영문, 숫자, 특수문자 합 8~15자)',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                hintText: '비밀번호 확인',
                obscureText: true,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
