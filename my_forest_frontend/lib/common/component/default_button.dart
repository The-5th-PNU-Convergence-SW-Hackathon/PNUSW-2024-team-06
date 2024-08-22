import 'package:flutter/material.dart';

import '../const/button_style.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: MyButtonStyle.primary,
      child: child,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          onPressed == null ? MyButtonStyle.disable : MyButtonStyle.secondary,
      child: child,
    );
  }
}

class ContainerButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const ContainerButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          onPressed == null ? MyButtonStyle.disable : MyButtonStyle.container,
      child: child,
    );
  }
}
