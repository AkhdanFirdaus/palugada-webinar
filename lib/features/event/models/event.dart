import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/index.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(name: 'webinar_id') required final int id,
    @JsonKey(name: 'nama') required final String nama,
    @JsonKey(name: 'deskripsi') required final String deskripsi,
    @JsonKey(name: 'kuota') required final int kuota,
    @JsonKey(name: 'tanggal') required final String tanggal,
    @JsonKey(name: 'jam_mulai') required final String jamMulai,
    @JsonKey(name: 'jam_selesai') required final String jamSelesai,
    @JsonKey(name: 'link') required final String link,
    @JsonKey(name: 'penyelenggara') required final User penyelenggara,
    @JsonKey(name: 'narasumber') final List<User>? narasumber,
    final List<User>? pendaftar,
  }) = _Event;

  factory Event.fromJson(Json json) => _$EventFromJson(json);
}
