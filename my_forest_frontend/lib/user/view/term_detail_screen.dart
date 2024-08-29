import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/colors.dart';
import '../../common/const/data.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class TermDetailScreen extends StatelessWidget {
  static String get routeName => 'term_detail';

  const TermDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id'];

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: getTitle(
          id: id,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Text(
            getDescription(
              id: id,
            ),
            style: MyTextStyle.descriptionRegular.copyWith(
              color: MyColor.darkGrey,
            ),
          ),
        ),
      ),
    );
  }

  String getTitle({
    required String? id,
  }) {
    switch (id) {
      case '0':
        return '이용약관 동의';
      case "1":
        return '개인정보 취급방침 동의';
      case "2":
        return '마케팅 정보 수신 동의';
      default:
        return '약관 동의';
    }
  }

  String getDescription({
    required String? id,
  }) {
    switch (id) {
      case '0':
        return TermData.useTerm;
      case "1":
        return TermData.personalInfo;
      case "2":
        return TermData.marketing;
      default:
        return '';
    }
  }
}
