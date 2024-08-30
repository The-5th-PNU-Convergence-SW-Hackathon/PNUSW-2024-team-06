import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/default_button.dart';
import 'package:my_forest_frontend/common/layout/default_app_bar.dart';
import 'package:my_forest_frontend/common/layout/default_layout.dart';
import 'package:my_forest_frontend/common/view/completion_screen.dart';
import 'package:my_forest_frontend/user/compoenet/showKakaoAddress.dart';
import 'package:my_forest_frontend/user/model/user_model.dart';
import 'package:my_forest_frontend/user/provider/user_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class DeliveryScreen extends ConsumerStatefulWidget {
  static String get routeName => "delivery";

  const DeliveryScreen({super.key});

  @override
  ConsumerState<DeliveryScreen> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends ConsumerState<DeliveryScreen> {
  final AddressRepository repository = AddressRepository();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  bool isSelectedEqual = true;

  @override
  Widget build(BuildContext context) {
    final UserModel user = ref.watch(userProvider) as UserModel;

    if (isSelectedEqual) {
      _nameController.text = user.name;
      _phoneController.text = user.phone;
      _addressController.text = user.address.address;
      _detailAddressController.text = user.address.detailAddress;
      _memoController.text = user.address.memo;
    } else {
      _nameController.text = '';
      _phoneController.text = '';
      _addressController.text = '';
      _detailAddressController.text = '';
      _memoController.text = '';
    }

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '반려식물 배송하기'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '배송 정보',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  TextButton(
                    onPressed: () async {
                      String address =
                          await repository.getKakaoAddress(context: context);
                      _addressController.text = address;
                      _detailAddressController.clear();
                    },
                    child: Text(
                      '주소 검색',
                      style: MyTextStyle.bodyRegular.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              _renderTitleAndForm(
                title: '받으시는 분',
                controller: _nameController,
              ),
              const SizedBox(height: 4.0),
              _renderTitleAndForm(
                title: '연락처',
                controller: _phoneController,
              ),
              const SizedBox(height: 4.0),
              _renderTitleAndForm(
                title: '주소',
                controller: _addressController,
              ),
              const SizedBox(height: 4.0),
              _renderTitleAndForm(
                title: '상세주소',
                controller: _detailAddressController,
              ),
              const SizedBox(height: 4.0),
              _renderTitleAndForm(
                title: '배송메모',
                controller: _memoController,
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    '주문자 정보와 동일',
                    style: MyTextStyle.descriptionRegular,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSelectedEqual = !isSelectedEqual;
                      });
                    },
                    icon: PhosphorIcon(
                      isSelectedEqual
                          ? PhosphorIcons.checkSquare(PhosphorIconsStyle.fill)
                          : PhosphorIcons.square(),
                      size: 24.0,
                      color: MyColor.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              PrimaryButton(
                onPressed: () {
                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '배송 신청이\n정상적으로\n완료되었습니다.'},
                  );

                  ref.read(userProvider.notifier).deliveryForest();
                },
                child: const Text('배송 받기'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTitleAndForm({
    required String title,
    required TextEditingController controller,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100.0,
          child: Text(
            title,
            style: MyTextStyle.descriptionRegular,
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: controller,
            maxLines: title == "주소" ? 2 : 1,
            onChanged: (String value) {},
            onSaved: (String? newValue) {},
            validator: (String? value) {
              return null;
            },
            style: MyTextStyle.descriptionRegular,
          ),
        ),
      ],
    );
  }
}
