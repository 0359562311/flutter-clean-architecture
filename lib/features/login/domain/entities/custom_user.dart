class CustomUser{
  String uid;
  String? name;
  String? phone;

  CustomUser({required this.uid, this.name, this.phone});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CustomUser && runtimeType == other.runtimeType &&
              uid == other.uid && name == other.name && phone == other.phone;

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ phone.hashCode;

}