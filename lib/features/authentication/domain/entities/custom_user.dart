class CustomUser{
  String uid;
  String? name;
  String? phone;
  String? deviceId;

  CustomUser({required this.uid, this.name, this.phone, this.deviceId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomUser &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          name == other.name &&
          phone == other.phone &&
          deviceId == other.deviceId;

  @override
  int get hashCode =>
      uid.hashCode ^ name.hashCode ^ phone.hashCode ^ deviceId.hashCode;
}