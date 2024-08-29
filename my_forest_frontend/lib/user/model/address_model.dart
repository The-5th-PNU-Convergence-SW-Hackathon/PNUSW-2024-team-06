class AddressModel {
  final String address;
  final String detailAddress;
  final String memo;

  AddressModel({
    required this.address,
    required this.detailAddress,
    required this.memo,
  });

  AddressModel copyWith({
    String? address,
    String? detailAddress,
    String? memo,
  }) {
    return AddressModel(
      address: address ?? this.address,
      detailAddress: detailAddress ?? this.detailAddress,
      memo: memo ?? this.memo,
    );
  }
}
