import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_forest_frontend/common/component/custom_drop_down_single.dart';
import 'package:my_forest_frontend/user/compoenet/showKakaoAddress.dart';

import '../../common/component/custom_text_form_field.dart';
import '../../common/component/default_button.dart';
import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/component/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'login_screen.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => "edit_profile";

  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final AddressRepository repository = AddressRepository();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _detailAddressController =
      TextEditingController();
  String memo = '';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;

    _nameController.text = user.name;
      _phoneController.text = user.phone;
    _addressController.text = user.address.address;
    _detailAddressController.text = user.address.detailAddress;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보 수정'),
      child: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 20.0,
            ),
            child: Container(
              color: MyColor.empty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      '회원 정보',
                      style: MyTextStyle.bodyTitleMedium,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePath.user,
                        width: 72.0,
                        height: 72.0,
                      ),
                      const SizedBox(width: 8.0),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '프로필 변경',
                          style: MyTextStyle.bodyRegular.copyWith(
                            color: MyColor.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: _nameController,
                    onChanged: (String? value) {},
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: _phoneController,
                    onChanged: (String? value) {},
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '배송 정보',
                          style: MyTextStyle.bodyTitleMedium,
                        ),
                        TextButton(
                          onPressed: () async {
                            String address = await repository.getKakaoAddress(
                                context: context);
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
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: _addressController,
                    onChanged: (String? value) {},
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    controller: _detailAddressController,
                    hintText: "상세 주소를 입력해 주세요.",
                    onChanged: (String? value) {},
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  CustomSingleDropDown(
                    dropdownList: const [
                      '부재시 휴대폰으로 연락 주세요.',
                      '부재시 경비실에 맡겨 주세요.',
                      '배송전에 연락 주세요.',
                      '택배 보관함에 보관해 주세요.',
                      '부재시 집 앞에 놔주세요.',
                    ],
                    hintText: "배송 메모를 선택해 주세요.",
                    dropdownHeight: 240,
                    onChanged: (String value) {
                      memo = value;
                    },
                    defaultValue: user.address.memo,
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        showCustomCupertinoAlert(
                          context: context,
                          titleWidget: const Text('로그아웃 하시겠습니까?'),
                          completeText: '확인',
                          completeFunction: () {
                            context.goNamed(LoginScreen.routeName);
                          },
                          cancelText: '취소',
                          cancelFunction: () {
                            context.pop();
                          },
                        );
                      },
                      child: Text(
                        '로그아웃',
                        style: MyTextStyle.minimumRegular.copyWith(
                          color: MyColor.darkGrey,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  PrimaryButton(
                    onPressed: () {
                      ref.read(userProvider.notifier).updateInfo(
                            name: _nameController.text,
                            phone: _phoneController.text,
                            address: _addressController.text,
                            detailAddress: _detailAddressController.text,
                            memo: memo,
                          );

                      showCustomToast(context, msg: '저장이 완료되었습니다.');
                      context.pop();
                    },
                    child: const Text('변경하기'),
                  ),
                  const SizedBox(height: 40.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
