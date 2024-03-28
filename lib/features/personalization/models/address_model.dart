class AddressModel {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? street;
  final String? postalCode;
  final String? district;
  final String? state;

  const AddressModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.street,
    this.postalCode,
    this.district,
    this.state,
  });
  AddressModel copyWith(
      {int? id,
      String? name,
      String? phoneNumber,
      String? street,
      String? postalCode,
      String? district,
      String? state,
      String? country}) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      postalCode: postalCode ?? this.postalCode,
      district: district ?? this.district,
      state: state ?? this.state,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'postalCode': postalCode,
      'district': district,
      'state': state,
    };
  }

  static AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        phoneNumber:
            json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        street: json['street'] == null ? null : json['street'] as String,
        postalCode:
            json['postalCode'] == null ? null : json['postalCode'] as String,
        district: json['district'] == null ? null : json['district'] as String,
        state: json['state'] == null ? null : json['state'] as String);
  }

  @override
  String toString() {
    return '''AddressModel(
                name:$name,
phoneNumber:$phoneNumber,
street:$street,
postalCode:$postalCode,
district:$district,
state:$state,
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AddressModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.street == street &&
        other.postalCode == postalCode &&
        other.district == district &&
        other.state == state;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, phoneNumber, street, postalCode,
        district, state);
  }
}
