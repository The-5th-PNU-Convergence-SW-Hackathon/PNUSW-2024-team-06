import 'package:flutter/material.dart';

import '../component/default_button.dart';
import '../const/colors.dart';

class DefaultBottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const DefaultBottomButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomPaint(
        painter: TopShadowPainter(),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [],
            color: MyColor.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: CustomPaint(
              painter: TopShadowPainter(),
              child: PrimaryButton(
                onPressed: onPress,
                child: Text(title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = MyColor.barrier
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 10)
      ..lineTo(0, 10)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
