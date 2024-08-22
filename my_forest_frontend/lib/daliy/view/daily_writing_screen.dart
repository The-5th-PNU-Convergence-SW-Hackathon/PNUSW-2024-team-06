import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class DailyWritingScreen extends ConsumerWidget {
  static String get routeName => "daily_writing";

  final String id;

  const DailyWritingScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '일일문답 작성'),
      child: Text(id),
    );
  }
}
