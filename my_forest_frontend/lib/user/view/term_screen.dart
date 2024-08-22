import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/default_button.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import 'certification_screen.dart';
import 'term_detail_screen.dart';

class TermScreen extends StatelessWidget {
  static String get routeName => "term";

  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '이용 약관'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              '서비스 이용 약관에\n동의해 주세요.',
              style: MyTextStyle.headTitle,
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: TermContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class TermContainer extends StatefulWidget {
  const TermContainer({super.key});

  @override
  State<TermContainer> createState() => _TermContainerState();
}

class _TermContainerState extends State<TermContainer> {
  bool isTotal = false;
  bool isUse = false;
  bool isPersonalInfo = false;
  bool isMarketing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isTotal = !isTotal;
                  if (isTotal) {
                    isUse = true;
                    isPersonalInfo = true;
                    isMarketing = true;
                  } else {
                    isUse = false;
                    isPersonalInfo = false;
                    isMarketing = false;
                  }
                });
              },
              child: Container(
                color: MyColor.empty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isTotal
                          ? PhosphorIcon(
                              PhosphorIcons.checkSquare(
                                  PhosphorIconsStyle.fill),
                              size: 32.0,
                              color: MyColor.primary,
                            )
                          : PhosphorIcon(
                              PhosphorIcons.square(),
                              size: 32.0,
                              color: MyColor.text,
                            ),
                      const SizedBox(width: 12.0),
                      Text(
                        '전체 약관에 동의합니다.',
                        style: MyTextStyle.bodyTitleBold.copyWith(height: 1.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            _CheckBox(
              index: 0,
              title: '이용약관 동의',
              isRequired: true,
              onTap: onTapUse,
              isSelected: isUse,
            ),
            const SizedBox(height: 8.0),
            _CheckBox(
              index: 1,
              title: '개인정보 취급방침 동의',
              isRequired: true,
              onTap: onTapPersonalInfo,
              isSelected: isPersonalInfo,
            ),
            const SizedBox(height: 8.0),
            _CheckBox(
              index: 2,
              title: '마케팅 정보 수신 동의',
              isRequired: false,
              onTap: onTapMarketing,
              isSelected: isMarketing,
            ),
          ],
        ),
        PrimaryButton(
          onPressed: isUse && isPersonalInfo
              ? () {
                  context.goNamed(CertificationScreen.routeName);
                }
              : null,
          child: const Text('확인'),
        ),
      ],
    );
  }

  void onTapUse() {
    setState(() {
      isUse = !isUse;
      if (!isUse) {
        isTotal = false;
      } else if (isPersonalInfo && isMarketing) {
        isTotal = true;
      }
    });
  }

  void onTapPersonalInfo() {
    setState(() {
      isPersonalInfo = !isPersonalInfo;
      if (!isPersonalInfo) {
        isTotal = false;
      } else if (isUse && isMarketing) {
        isTotal = true;
      }
    });
  }

  void onTapMarketing() {
    setState(() {
      isMarketing = !isMarketing;
      if (!isMarketing) {
        isTotal = false;
      } else if (isUse && isPersonalInfo) {
        isTotal = true;
      }
    });
  }
}

class _CheckBox extends StatelessWidget {
  final int index;
  final String title;
  final bool isRequired;
  final VoidCallback onTap;
  final bool isSelected;

  const _CheckBox({
    super.key,
    required this.index,
    required this.title,
    required this.isRequired,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: MyColor.empty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isSelected
                      ? PhosphorIcon(
                          PhosphorIcons.checkSquare(PhosphorIconsStyle.fill),
                          color: MyColor.primary,
                          size: 24.0,
                        )
                      : PhosphorIcon(
                          PhosphorIcons.square(),
                          size: 24.0,
                        ),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: MyTextStyle.descriptionRegular,
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: isRequired ? MyColor.primary : MyColor.darkGrey,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      child: Text(
                        isRequired ? '필수' : '선택',
                        style: MyTextStyle.minimumRegular.copyWith(
                          color:
                              isRequired ? MyColor.primary : MyColor.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  context.pushNamed(
                    TermDetailScreen.routeName,
                    pathParameters: {'id': index.toString()},
                  );
                },
                iconSize: 24.0,
                icon: PhosphorIcon(
                  PhosphorIcons.caretRight(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
