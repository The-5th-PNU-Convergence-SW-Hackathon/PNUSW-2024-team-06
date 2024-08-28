import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/const/colors.dart';
import 'package:my_forest_frontend/common/const/text_styles.dart';
import 'package:my_forest_frontend/daliy/provider/daily_provider.dart';
import 'package:my_forest_frontend/daliy/view/daily_writing_screen.dart';

import '../../common/const/data.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class DailyScreen extends ConsumerWidget {
  static String get routeName => "daily";

  const DailyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailies = ref.watch(dailyProvider);
    dailies.forEach((element) {
      print(element.id);
      print(element.answer);
    });

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '일일문답'),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          final daily = dailies[index];

          return InkWell(
            onTap: () {
              context.pushNamed(
                DailyWritingScreen.routeName,
                pathParameters: {'id': daily.id.toString()},
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: daily.answer.isEmpty ? MyColor.empty: MyColor.third,
                border: Border.all(
                  width: 2.0,
                  color:
                      daily.answer.isEmpty ? MyColor.primary : MyColor.empty,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "$index. ${daily.question}",
                  style: MyTextStyle.bodyMedium,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20.0);
        },
        itemCount: dailyQuestions.length,
      ),
    );
  }
}
