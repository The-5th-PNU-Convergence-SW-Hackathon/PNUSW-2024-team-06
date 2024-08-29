import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

import '../../common/layout/default_app_bar.dart';

class AddressRepository {
  Future<String> getKakaoAddress({
    required BuildContext context,
  }) async {
    try {
      Kpostal result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => KpostalView(
            appBar: const DefaultAppBar(title: '주소 검색'),
          ),
        ),
      );

      if (result.postCode.isEmpty) {
        return result.address;
      } else {
        return '(${result.postCode}) ${result.address}';
      }
    } catch (e) {
      debugPrint(e.toString());
      return 'fail';
    }
  }
}
