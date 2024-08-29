import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';

class CustomSingleDropDown extends StatelessWidget {
  final List<String> dropdownList;
  final String? defaultValue;
  final String hintText;
  final ValueChanged<String> onChanged;
  final double dropdownHeight;

  const CustomSingleDropDown({
    super.key,
    required this.dropdownList,
    this.defaultValue,
    required this.hintText,
    required this.onChanged,
    required this.dropdownHeight,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<int>(
      // controller: _controller,
      // type
      selectionType: SelectionType.single,
      hint: hintText,
      hintStyle: MyTextStyle.descriptionRegular.copyWith(
        color: MyColor.darkGrey,
      ),
      // 선택 했을 때 동작
      onOptionSelected: (List<ValueItem> selectedOptions) {
        onChanged(selectedOptions.first.label);
      },
      onOptionRemoved: (index, option) {},

      options: dropdownList.mapIndexed((index, element) {
        return ValueItem<int>(
          label: element,
          value: index,
        );
      }).toList(),

      chipConfig: const ChipConfig(wrapType: WrapType.wrap),

      // 일반 상태
      optionTextStyle: MyTextStyle.descriptionRegular,
      optionsBackgroundColor: MyColor.empty,

      // 선택된 상태
      singleSelectItemStyle: MyTextStyle.descriptionRegular,
      selectedOptionBackgroundColor: MyColor.lightGrey,
      selectedOptionTextColor: MyColor.primary,
      selectedOptionIcon: PhosphorIcon(
        PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
      ),

      // form style
      borderRadius: 8.0,
      borderColor: MyColor.middleGrey,
      borderWidth: 1.0,
      clearIcon: null,

      // dropdown style
      dropdownHeight: dropdownHeight,
      dropdownBorderRadius: 8.0,
      focusedBorderColor: MyColor.primary,
      focusedBorderWidth: 2.0,

      // 선택된 데이터
      selectedOptions: defaultValue == null
          ? []
          : [
              ValueItem(label: defaultValue!, value: 0),
            ],
      // disabledOptions: [
      //   ValueItem(label: '선택', value: 0),
      // ],
    );
  }
}
