import 'package:pertemuan15/model/art.dart';
import 'package:pertemuan15/screens/profile/widgets/experience.dart';
import 'dart:convert';

class Profile {
  String? name;
  String? twitter;
  String? desc;
  String? email;
  Profile(
      {this.name,
      this.twitter,
      this.desc,
      this.email,
      this.collections,
      this.creations});
  List<Art>? creations;
  List<Experience>? collections;

  static Profile genreateProfile() {
    return Profile(
        name: 'Rifqi Riza Irfansyah',
        twitter: '@rifqipansyah',
        desc:
            'Saya berkuliah di politeknik TEDC Bandung, saya berpengalaman pada bidang programmer lebih dari 5 tahun',
        email: 'rizairfansyahrifqi@gmail.com',
        creations: [
          Art(name: 'Portofolio 1', like: 5000, desc: 'Berhasil membuat'),
          Art(name: 'Portofolio 2', like: 5000, desc: 'Berhasil membuat'),
          Art(name: 'Portofolio 3', like: 5000, desc: 'Berhasil membuat'),
          Art(name: 'Portofolio 4', like: 5000, desc: 'Berhasil membuat')
        ],
        collections: [
          // const Experience(
          //     nama:
          //         'Saya bekerja sebagai Fullstack Developer untuk PPTIK ITB Selama 3 Tahun. Menggunakan javascript sebagai bahasa pemograman utama',
          //     nim: 'Bandung ITB, Puncrut',
          //     prodi: '2018 - 2021',
          //     agama: 'PPTIK ITB'),
        ]);
  }
}

// To parse this JSON data, do
//
// final experience = experienceFromJson(jsonString);

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.agama,
  });

  String nama;
  String nim;
  String prodi;
  String agama;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        nama: json["nama"],
        nim: json["nim"],
        prodi: json["prodi"],
        agama: json["agama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nim": nim,
        "prodi": prodi,
        "agama": agama,
      };
}
