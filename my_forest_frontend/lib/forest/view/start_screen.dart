import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/default_button.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:my_forest_frontend/forest/view/select_forest_screen.dart';

import '../../common/const/image_path.dart';
import '../../common/layout/default_layout.dart';

class StartScreen extends StatelessWidget {
  static String get routeName => 'start';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImagePath.defaultBackground),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
          child: Container(
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagePath.logoBlack,
                      width: 100.0,
                    ),
                    const Text(
                      '반려 식물 선택하기',
                      style: MyTextStyle.bigTitleBold,
                    ),
                    const SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        '식물 도감에서 나만의 반려 식물을 고르고 성장시켜 직접 받아보세요!',
                        style: MyTextStyle.descriptionRegular.copyWith(
                          color: MyColor.darkGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: PrimaryButton(
                    onPressed: () {
                      context.goNamed(SelectForestScreen.routeName);
                    },
                    child: const Text('시작'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
