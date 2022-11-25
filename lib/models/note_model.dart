import 'dart:ffi';

class NoteModel {
  NoteModel({
    this.id,
    this.judul,
    this.deskripsi,
    this.waktu,
    this.interval,
    this.lampiran,
  });

  int? id;
  String? judul;
  String? deskripsi;
  String? waktu;
  Int? interval;
  String? lampiran;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        waktu: json["waktu"],
        interval: json["interval"],
        lampiran: json["lampiran"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "waktu": waktu,
        "interval": interval,
        "lampiran": lampiran,
      };
}
