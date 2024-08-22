import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/custom_loading.dart';
import '../const/colors.dart';

class DefaultLayout extends ConsumerWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appbar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget child;
  final bool isLoading;

  const DefaultLayout({
    super.key,
    this.backgroundColor,
    this.appbar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Scaffold(
          appBar: appbar,
          backgroundColor: backgroundColor ?? MyColor.white,
          // 기본배경이 완전 흰색은 아니다.
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: child,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
        ),
        Positioned.fill(
          child: Visibility(
            visible: isLoading,
            child: const Center(
              child: CustomLoadingScreen(),
            ),
          ),
        )
      ],
    );
  }
}
