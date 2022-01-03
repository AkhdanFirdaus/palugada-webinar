// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['webinar_id'] as int,
      nama: json['nama'] as String,
      deskripsi: json['deskripsi'] as String,
      kuota: json['kuota'] as int,
      tanggal: json['tanggal'] as String,
      jamMulai: json['jam_mulai'] as String,
      jamSelesai: json['jam_selesai'] as String,
      link: json['link'] as String,
      penyelenggara:
          User.fromJson(json['penyelenggara'] as Map<String, dynamic>),
      narasumber: (json['narasumber'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendaftar: (json['pendaftar'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'webinar_id': instance.id,
      'nama': instance.nama,
      'deskripsi': instance.deskripsi,
      'kuota': instance.kuota,
      'tanggal': instance.tanggal,
      'jam_mulai': instance.jamMulai,
      'jam_selesai': instance.jamSelesai,
      'link': instance.link,
      'penyelenggara': instance.penyelenggara,
      'narasumber': instance.narasumber,
      'pendaftar': instance.pendaftar,
    };
