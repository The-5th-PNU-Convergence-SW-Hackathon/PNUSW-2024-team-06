import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 60.0;
  final String title;
  final Widget? titleWidget;
  final List<Widget>? action;
  final Widget? leading;
  final double? leadingWidth;
  final double? elevation;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.leading,
    this.leadingWidth,
    this.action,
    this.elevation,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (widget.titleWidget == null)
          ? Text(
              widget.title,
              style:
                  MyTextStyle.bodyBold.copyWith(color: widget.foregroundColor),
            )
          : widget.titleWidget,
      leading: widget.leading,
      leadingWidth: widget.leadingWidth ?? 72.0,
      centerTitle: widget.centerTitle,
      actions: widget.action,
      elevation: widget.elevation ?? 0.0,
      scrolledUnderElevation: 0.0,
      backgroundColor: widget.backgroundColor ?? MyColor.white,
      foregroundColor: widget.foregroundColor ?? MyColor.text,
    );
  }
}
