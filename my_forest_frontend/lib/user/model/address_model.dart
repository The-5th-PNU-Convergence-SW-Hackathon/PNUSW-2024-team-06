class AddressModel {
  final int id; // primary key
  final String name;
  final String phone;
  final String address;
  final String detailAddress;
  final String memo;

  AddressModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.detailAddress,
    required this.memo,
  });

  AddressModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? address,
    String? detailAddress,
    String? memo,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      detailAddress: detailAddress ?? this.detailAddress,
      memo: memo ?? this.memo,
    );
  }
}
