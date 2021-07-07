import 'package:equatable/equatable.dart';
import 'user.dart';

typedef Json = Map<String, dynamic>;

class WebinarState extends Equatable {
  final int id;
  final String nama;
  final String deskripsi;
  final int kuota;
  final String tanggal;
  final String jamMulai;
  final String jamSelesai;
  final String link;
  final User penyelenggara;
  final List<User>? narasumber;
  final List<User>? pendaftar;

  WebinarState({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.kuota,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelesai,
    required this.link,
    required this.penyelenggara,
    this.narasumber,
    this.pendaftar,
  });

  WebinarState copyWith({
    int? id,
    String? nama,
    String? deskripsi,
    int? kuota,
    String? tanggal,
    String? password,
    String? jamMulai,
    String? jamSelesai,
    String? link,
    User? penyelenggara,
    List<User>? narasumber,
    List<User>? pendaftar,
  }) {
    return WebinarState(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      kuota: kuota ?? this.kuota,
      tanggal: tanggal ?? this.tanggal,
      jamMulai: jamMulai ?? this.jamMulai,
      jamSelesai: jamSelesai ?? this.jamSelesai,
      link: link ?? this.link,
      penyelenggara: penyelenggara ?? this.penyelenggara,
      narasumber: narasumber ?? this.narasumber,
      pendaftar: pendaftar ?? this.pendaftar,
    );
  }

  factory WebinarState.fromJson(Json json) {
    return WebinarState(
      id: json['webinar_id'],
      nama: json['nama'],
      deskripsi: json['deskripsi'],
      kuota: json['kuota'],
      tanggal: json['tanggal'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      link: json['link'],
      penyelenggara: User.fromJson(json['penyelenggara']),
      narasumber: json['narasumber'] == null
          ? null
          : (json['narasumber'] as List)
              .map<User>((e) => User.fromJson(e as Json))
              .toList(),
      pendaftar: json['pendaftar'] == null
          ? null
          : (json['pendaftar'] as List)
              .map<User>((e) => User.fromJson(e as Json))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'kuota': kuota,
      'nomor_telp': tanggal,
      'jam_mulai': jamMulai,
      'jam_selesai': jamSelesai,
      'link': link,
      'penyelenggara': penyelenggara,
      'narasumber': narasumber,
      'pendaftar': pendaftar,
    };
  }

  @override
  List<Object?> get props => [
        id,
        nama,
        kuota,
        tanggal,
        jamMulai,
        jamSelesai,
        link,
        penyelenggara,
        narasumber,
      ];
}
