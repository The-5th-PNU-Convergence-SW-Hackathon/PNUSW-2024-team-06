import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/view/home_screen.dart';
import '../component/default_button.dart';

class ErrorScreen extends StatelessWidget {
  static String get routeName => "error";

  final String error;

  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            context.goNamed(HomeScreen.routeName);
          },
          child: const Text('홈으로 이동'),
        ),
      ),
      body: Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
