import 'package:equatable/equatable.dart';
import 'package:palugada/models/user.dart';

typedef Json = Map<String, dynamic>;

class WebinarState extends Equatable {
  final int id;
  final String nama;
  final String deskripsi;
  final int kuota;
  final String tanggal;
  final String jamMulai;
  final String jamSelesai;
  final UserLoggedInState penyelenggara;
  final List<UserLoggedInState>? narasumber;

  WebinarState({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.kuota,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelesai,
    required this.penyelenggara,
    this.narasumber,
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
    UserLoggedInState? penyelenggara,
    List<UserLoggedInState>? narasumber,
  }) {
    return WebinarState(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      kuota: kuota ?? this.kuota,
      tanggal: tanggal ?? this.tanggal,
      jamMulai: jamMulai ?? this.jamMulai,
      jamSelesai: jamSelesai ?? this.jamSelesai,
      penyelenggara: penyelenggara ?? this.penyelenggara,
      narasumber: narasumber ?? this.narasumber,
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
      penyelenggara: UserLoggedInState.fromJson(json['penyelenggara']),
      narasumber: json['narasumber'] == null
          ? null
          : (json['narasumber'] as List)
              .map<UserLoggedInState>(
                  (e) => UserLoggedInState.fromJson(e as Json))
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
      'jamSelesai': jamSelesai,
      'penyelenggara': penyelenggara,
      'narasumber': narasumber,
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
        penyelenggara,
        narasumber,
      ];
}
