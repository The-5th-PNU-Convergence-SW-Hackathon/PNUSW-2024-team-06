import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/component/default_button.dart';
import '../../common/component/show/show_custom_toast.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'find_password_input_screen.dart';

class FindPasswordScreen extends ConsumerStatefulWidget {
  static String get routeName => 'find_password';

  const FindPasswordScreen({super.key});

  @override
  ConsumerState<FindPasswordScreen> createState() => _FindPasswordScreenState();
}

class _FindPasswordScreenState extends ConsumerState<FindPasswordScreen> {
  bool isPushCertification = false;
  bool isDoneCertification = false;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '비밀번호 찾기'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                '휴대폰 본인 인증을\n진행해 주세요.',
                style: MyTextStyle.headTitle,
              ),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: '휴대폰 번호',
                      onChanged: (String value) {},
                      onSaved: (String? newValue) {},
                      validator: (String? value) {
                        return null;
                      },
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  SecondaryButton(
                    onPressed: () {
                      showCustomToast(context, msg: '인증번호가 전송되었습니다.');
                      setState(() {
                        isPushCertification = true;
                      });
                    },
                    child: isPushCertification
                        ? const Text('재 전송')
                        : const Text('인증번호 전송'),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Visibility(
                visible: isPushCertification && !isDoneCertification,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: '인증번호 입력',
                        onChanged: (String value) {},
                        onSaved: (String? newValue) {},
                        validator: (String? value) {
                          return null;
                        },
                        textInputType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    SecondaryButton(
                      onPressed: () async {
                        context.pushNamed(FindPasswordInputScreen.routeName);
                      },
                      child: const Text('인증번호 확인'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
