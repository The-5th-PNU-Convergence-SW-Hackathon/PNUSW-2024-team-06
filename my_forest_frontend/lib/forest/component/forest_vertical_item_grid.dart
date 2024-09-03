import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/custom_text_form_field.dart';
import 'package:my_forest_frontend/common/component/show/show_custom_general_dialog.dart';
import 'package:my_forest_frontend/forest/component/forest_card.dart';
import 'package:my_forest_frontend/forest/model/forest_model.dart';
import 'package:my_forest_frontend/home/view/home_screen.dart';
import 'package:my_forest_frontend/user/provider/user_provider.dart';

import '../../common/component/default_button.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class ForestVerticalItemGrid extends ConsumerStatefulWidget {
  final List<ForestModel> forests;

  const ForestVerticalItemGrid({
    super.key,
    required this.forests,
  });

  @override
  ConsumerState<ForestVerticalItemGrid> createState() =>
      _ForestVerticalItemGridState();
}

class _ForestVerticalItemGridState
    extends ConsumerState<ForestVerticalItemGrid> {
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = 16.0;
    const double horizontalPadding = 24.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: itemSpacing * 2,
        crossAxisSpacing: itemSpacing,
        childAspectRatio: itemWidth / (itemWidth + 80),
      ),
      itemCount: widget.forests.length,
      itemBuilder: (context, index) {
        final forest = widget.forests[index];

        return GestureDetector(
          onTap: () {
            showCustomGeneralDialog(
              context: context,
              bottomSheetWidget: Container(
                height: 280.0,
                color: MyColor.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        forest.title,
                        style: MyTextStyle.bodyTitleBold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: "직접 입력, 최대 8글자",
                        onChanged: (String value) {
                          nickname = value;
                        },
                        onSaved: (String? newValue) {},
                        validator: (String? value) {
                          return null;
                        },
                        maxLength: 8,
                      ),
                      const SizedBox(height: 20.0),
                      PrimaryButton(
                        onPressed: () {
                          ref.read(userProvider.notifier).addForest(
                                  forest: forest.copyWith(
                                nickname: nickname,
                              ));

                          context.goNamed(HomeScreen.routeName);
                        },
                        child: const Text('이름 짓기 완료'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: ForestCard.fromModel(model: forest),
        );
      },
    );
  }
}
