class CustomUser{
  String id;
  String role;
  String name;
  String? deviceId;
  DateTime dob;
  String gender;
  String? phoneNumber;
  String? address;


  CustomUser(
      {required this.id,
      required this.role,
        required this.name,
        required this.deviceId,
        required this.dob,
        required this.gender,
      this.phoneNumber,
      this.address});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          role == other.role &&
          name == other.name &&
          deviceId == other.deviceId;

  @override
  int get hashCode =>
      id.hashCode ^ role.hashCode ^ name.hashCode ^ deviceId.hashCode;

  @override
  String toString() {
    return 'CustomUser{id: $id, role: $role, deviceId: $deviceId}';
  }
}