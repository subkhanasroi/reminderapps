class UserModel {
  UserModel({
    this.id,
    this.namaDepan,
    this.namaBelakang,
    this.email,
    this.tanggalLahir,
    this.jenisKelamin,
    this.password,
    this.imgProfile,
  });

  int? id;
  String? namaDepan;
  String? namaBelakang;
  String? email;
  DateTime? tanggalLahir;
  int? jenisKelamin;
  String? password;
  String? imgProfile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        namaDepan: json["namaDepan"],
        namaBelakang: json["namaBelakang"],
        email: json["email"],
        tanggalLahir: json["tanggalLahir"],
        jenisKelamin: json["jenisKelamin"],
        password: json["password"],
        imgProfile: json["imgProfile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaDepan": namaDepan,
        "namaBelakang": namaBelakang,
        "email": email,
        "tanggalLahir": tanggalLahir,
        "jenisKelamin": jenisKelamin,
        "password": password,
        "imgProfile": imgProfile,
      };
}
