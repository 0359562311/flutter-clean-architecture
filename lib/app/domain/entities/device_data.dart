class DeviceData {
    DeviceData({
        required this.id,
        required this.deviceId,
        required this.deviceName,
    });

    int id;
    String deviceId;
    String deviceName;

    factory DeviceData.fromJson(Map<String, dynamic> json) => DeviceData(
        id: json["id"],
        deviceId: json["deviceId"],
        deviceName: json["deviceName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "deviceId": deviceId,
        "deviceName": deviceName,
    };
}
