class Schedule {
  Schedule({
    required this.tuanHoc,
    required this.phongHoc,
    required this.thuHoc,
    required this.tietBatDau,
    required this.tietKetThuc,
    required this.thoiGianBatDau,
    required this.thoiGianKetThuc,
  });

  final List<int> tuanHoc;
  final String phongHoc;
  final int thuHoc;
  final int tietBatDau;
  final int tietKetThuc;
  final String thoiGianBatDau;
  final String thoiGianKetThuc;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    tuanHoc: List<int>.from(json["tuanHoc"].map((x) => x)),
    phongHoc: json["phongHoc"],
    thuHoc: json["thuHoc"],
    tietBatDau: json["tietBatDau"],
    tietKetThuc: json["tietKetThuc"],
    thoiGianBatDau: json["thoiGianBatDau"],
    thoiGianKetThuc: json["thoiGianKetThuc"],
  );

  Map<String, dynamic> toJson() => {
    "tuanHoc": List<dynamic>.from(tuanHoc.map((x) => x)),
    "phongHoc": phongHoc,
    "thuHoc": thuHoc,
    "tietBatDau": tietBatDau,
    "tietKetThuc": tietKetThuc,
    "thoiGianBatDau": thoiGianBatDau,
    "thoiGianKetThuc": thoiGianKetThuc,
  };
}