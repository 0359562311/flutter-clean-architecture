class CustomUser{
  String uid;
  String? role;
  String? name;
  String? deviceId;

  CustomUser({required this.uid, this.name, this.deviceId, this.role});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomUser &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          role == other.role &&
          name == other.name &&
          deviceId == other.deviceId;

  @override
  int get hashCode =>
      uid.hashCode ^ role.hashCode ^ name.hashCode ^ deviceId.hashCode;
}