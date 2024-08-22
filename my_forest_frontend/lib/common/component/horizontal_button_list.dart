import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';

class HorizontalButtonList extends StatefulWidget {
  final List<HorizontalButtonModel> buttons;
  final int initialSelectedIndex;

  const HorizontalButtonList({
    super.key,
    required this.buttons,
    this.initialSelectedIndex = 0,
  });

  @override
  State<HorizontalButtonList> createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<HorizontalButtonList> {
  HorizontalButtonModel? selectedButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.0,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final button = widget.buttons[index];
          return _ContainerInkWell(
            title: button.title,
            isSelected: selectedButton == null
                ? index == widget.initialSelectedIndex
                : selectedButton!.title == button.title,
            onTap: () {
              setState(() {
                selectedButton = button;
              });
              button.onTap();
            },
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(width: 8.0);
        },
        itemCount: widget.buttons.length,
      ),
    );
  }
}

class HorizontalButtonModel {
  final String title;
  final VoidCallback onTap;

  const HorizontalButtonModel({
    required this.title,
    required this.onTap,
  });
}

class _ContainerInkWell extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ContainerInkWell({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MyColor.primary : MyColor.empty,
          border: Border.all(
            width: 1.0,
            color: isSelected ? MyColor.empty : MyColor.middleGrey,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            title,
            style: MyTextStyle.bodyRegular.copyWith(
              color: isSelected ? MyColor.white : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
