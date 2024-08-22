import 'package:flutter/material.dart';

import '../const/colors.dart';

class DividerContainer extends StatelessWidget {
  final double topHeight;
  final double bottomHeight;

  const DividerContainer({
    super.key,
    this.topHeight = 0.0,
    this.bottomHeight = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topHeight,
        bottom: bottomHeight,
      ),
      child: Container(
        height: 10.0,
        color: MyColor.lightGrey,
      ),
    );
  }
}
