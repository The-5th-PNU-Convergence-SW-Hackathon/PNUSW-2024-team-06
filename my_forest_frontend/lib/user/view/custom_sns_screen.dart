import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/image_path.dart';
import '../../home/view/home_screen.dart';

class CustomSnsScreen extends StatefulWidget {
  static String get routeName => 'sns';

  const CustomSnsScreen({super.key});

  @override
  State<CustomSnsScreen> createState() => _CustomSnsScreenState();
}

class _CustomSnsScreenState extends State<CustomSnsScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  @override
  Widget build(BuildContext context) {
    final String? title = GoRouterState.of(context).pathParameters['title'];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              switchImagePath(kind: title),
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1));

    context.goNamed(HomeScreen.routeName);
  }

  String switchImagePath({required String? kind}) {
    switch (kind) {
      case 'apple':
        return ImagePath.appleScreen;
      case 'google':
        return ImagePath.googleScreen;
      case 'kakao':
        return ImagePath.kakaoScreen;
      case 'naver':
        return ImagePath.naverScreen;
      default:
        return '';
    }
  }
}
