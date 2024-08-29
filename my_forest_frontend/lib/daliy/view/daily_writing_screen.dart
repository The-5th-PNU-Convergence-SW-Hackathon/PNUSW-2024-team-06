import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/custom_text_form_field.dart';
import 'package:my_forest_frontend/common/component/default_button.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/common/const/image_path.dart';
import 'package:my_forest_frontend/daliy/provider/daily_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class DailyWritingScreen extends ConsumerStatefulWidget {
  static String get routeName => "daily_writing";

  final String id;

  const DailyWritingScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<DailyWritingScreen> createState() => _DailyWritingScreenState();
}

class _DailyWritingScreenState extends ConsumerState<DailyWritingScreen> {
  TextEditingController controller = TextEditingController();

  int emotionIndex = -1;
  String text = '';

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final daily = ref.watch(dailyDetailProvider(widget.id));

    if (daily.answer.isNotEmpty) {
      controller.text = daily.answer;
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '일일문답 작성'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '나를 돌아보고 성장시켜 보세요.',
              style: MyTextStyle.bodyTitleBold,
            ),
            const SizedBox(height: 20.0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColor.third,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          daily.question,
                          style: MyTextStyle.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showCustomGeneralDialog(
                          context: context,
                          bottomSheetWidget: Container(
                            height: 240.0,
                            color: MyColor.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(width: 32.0),
                                      const Text(
                                        '오늘은 어떤 하루 였나요?',
                                        style: MyTextStyle.bodyMedium,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: PhosphorIcon(
                                          PhosphorIcons.x(),
                                          size: 28.0,
                                          color: MyColor.text,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    runSpacing: 16,
                                    spacing: 16,
                                    runAlignment: WrapAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: List.generate(
                                      8,
                                      (int index) {
                                        return IconButton(
                                          onPressed: () {
                                            setState(() {
                                              emotionIndex = index;
                                            });
                                            context.pop();
                                          },
                                          icon: Image.asset(
                                            "${ImagePath.emotionDirectory}$index.png",
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColor.third,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Text(
                                "오늘의 감정",
                                style: MyTextStyle.bodyMedium,
                              ),
                              const SizedBox(height: 8.0),
                              daily.emotionImageUrl.isNotEmpty
                                  ? Image.asset(
                                      daily.emotionImageUrl,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    )
                                  : emotionIndex == -1
                                      ? PhosphorIcon(
                                          PhosphorIcons.plusCircle(),
                                          size: 32.0,
                                        )
                                      : Image.asset(
                                          "${ImagePath.emotionDirectory}$emotionIndex.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: CustomTextFormField(
                controller: controller,
                onChanged: (String value) {
                  text = value;
                },
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                hintText: "입력하기...",
              ),
            ),
            PrimaryButton(
              onPressed: emotionIndex == -1 || text.isEmpty ? null:() {
                ref.read(dailyProvider.notifier).updateItem(
                      id: widget.id,
                      answer: text,
                      emotionImageUrl:
                          '${ImagePath.emotionDirectory}$emotionIndex.png',
                    );

                context.pop();
              },
              child: const Text('등록하기'),
            ),
          ],
        ),
      ),
    );
  }
}
