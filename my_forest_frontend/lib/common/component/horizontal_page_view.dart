import 'package:flutter/material.dart';

class HorizontalPageView extends StatelessWidget {
  final double height;
  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;

  const HorizontalPageView({
    super.key,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
