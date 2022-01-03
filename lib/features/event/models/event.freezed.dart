// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {@JsonKey(name: 'webinar_id') required int id,
      @JsonKey(name: 'nama') required String nama,
      @JsonKey(name: 'deskripsi') required String deskripsi,
      @JsonKey(name: 'kuota') required int kuota,
      @JsonKey(name: 'tanggal') required String tanggal,
      @JsonKey(name: 'jam_mulai') required String jamMulai,
      @JsonKey(name: 'jam_selesai') required String jamSelesai,
      @JsonKey(name: 'link') required String link,
      @JsonKey(name: 'penyelenggara') required User penyelenggara,
      @JsonKey(name: 'narasumber') List<User>? narasumber,
      List<User>? pendaftar}) {
    return _Event(
      id: id,
      nama: nama,
      deskripsi: deskripsi,
      kuota: kuota,
      tanggal: tanggal,
      jamMulai: jamMulai,
      jamSelesai: jamSelesai,
      link: link,
      penyelenggara: penyelenggara,
      narasumber: narasumber,
      pendaftar: pendaftar,
    );
  }

  Event fromJson(Map<String, Object?> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  @JsonKey(name: 'webinar_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get nama => throw _privateConstructorUsedError;
  @JsonKey(name: 'deskripsi')
  String get deskripsi => throw _privateConstructorUsedError;
  @JsonKey(name: 'kuota')
  int get kuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'tanggal')
  String get tanggal => throw _privateConstructorUsedError;
  @JsonKey(name: 'jam_mulai')
  String get jamMulai => throw _privateConstructorUsedError;
  @JsonKey(name: 'jam_selesai')
  String get jamSelesai => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'penyelenggara')
  User get penyelenggara => throw _privateConstructorUsedError;
  @JsonKey(name: 'narasumber')
  List<User>? get narasumber => throw _privateConstructorUsedError;
  List<User>? get pendaftar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'webinar_id') int id,
      @JsonKey(name: 'nama') String nama,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'kuota') int kuota,
      @JsonKey(name: 'tanggal') String tanggal,
      @JsonKey(name: 'jam_mulai') String jamMulai,
      @JsonKey(name: 'jam_selesai') String jamSelesai,
      @JsonKey(name: 'link') String link,
      @JsonKey(name: 'penyelenggara') User penyelenggara,
      @JsonKey(name: 'narasumber') List<User>? narasumber,
      List<User>? pendaftar});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? deskripsi = freezed,
    Object? kuota = freezed,
    Object? tanggal = freezed,
    Object? jamMulai = freezed,
    Object? jamSelesai = freezed,
    Object? link = freezed,
    Object? penyelenggara = freezed,
    Object? narasumber = freezed,
    Object? pendaftar = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: deskripsi == freezed
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      kuota: kuota == freezed
          ? _value.kuota
          : kuota // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jamMulai: jamMulai == freezed
          ? _value.jamMulai
          : jamMulai // ignore: cast_nullable_to_non_nullable
              as String,
      jamSelesai: jamSelesai == freezed
          ? _value.jamSelesai
          : jamSelesai // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      penyelenggara: penyelenggara == freezed
          ? _value.penyelenggara
          : penyelenggara // ignore: cast_nullable_to_non_nullable
              as User,
      narasumber: narasumber == freezed
          ? _value.narasumber
          : narasumber // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      pendaftar: pendaftar == freezed
          ? _value.pendaftar
          : pendaftar // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'webinar_id') int id,
      @JsonKey(name: 'nama') String nama,
      @JsonKey(name: 'deskripsi') String deskripsi,
      @JsonKey(name: 'kuota') int kuota,
      @JsonKey(name: 'tanggal') String tanggal,
      @JsonKey(name: 'jam_mulai') String jamMulai,
      @JsonKey(name: 'jam_selesai') String jamSelesai,
      @JsonKey(name: 'link') String link,
      @JsonKey(name: 'penyelenggara') User penyelenggara,
      @JsonKey(name: 'narasumber') List<User>? narasumber,
      List<User>? pendaftar});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? deskripsi = freezed,
    Object? kuota = freezed,
    Object? tanggal = freezed,
    Object? jamMulai = freezed,
    Object? jamSelesai = freezed,
    Object? link = freezed,
    Object? penyelenggara = freezed,
    Object? narasumber = freezed,
    Object? pendaftar = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: deskripsi == freezed
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      kuota: kuota == freezed
          ? _value.kuota
          : kuota // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jamMulai: jamMulai == freezed
          ? _value.jamMulai
          : jamMulai // ignore: cast_nullable_to_non_nullable
              as String,
      jamSelesai: jamSelesai == freezed
          ? _value.jamSelesai
          : jamSelesai // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      penyelenggara: penyelenggara == freezed
          ? _value.penyelenggara
          : penyelenggara // ignore: cast_nullable_to_non_nullable
              as User,
      narasumber: narasumber == freezed
          ? _value.narasumber
          : narasumber // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      pendaftar: pendaftar == freezed
          ? _value.pendaftar
          : pendaftar // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {@JsonKey(name: 'webinar_id') required this.id,
      @JsonKey(name: 'nama') required this.nama,
      @JsonKey(name: 'deskripsi') required this.deskripsi,
      @JsonKey(name: 'kuota') required this.kuota,
      @JsonKey(name: 'tanggal') required this.tanggal,
      @JsonKey(name: 'jam_mulai') required this.jamMulai,
      @JsonKey(name: 'jam_selesai') required this.jamSelesai,
      @JsonKey(name: 'link') required this.link,
      @JsonKey(name: 'penyelenggara') required this.penyelenggara,
      @JsonKey(name: 'narasumber') this.narasumber,
      this.pendaftar});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: 'webinar_id')
  final int id;
  @override
  @JsonKey(name: 'nama')
  final String nama;
  @override
  @JsonKey(name: 'deskripsi')
  final String deskripsi;
  @override
  @JsonKey(name: 'kuota')
  final int kuota;
  @override
  @JsonKey(name: 'tanggal')
  final String tanggal;
  @override
  @JsonKey(name: 'jam_mulai')
  final String jamMulai;
  @override
  @JsonKey(name: 'jam_selesai')
  final String jamSelesai;
  @override
  @JsonKey(name: 'link')
  final String link;
  @override
  @JsonKey(name: 'penyelenggara')
  final User penyelenggara;
  @override
  @JsonKey(name: 'narasumber')
  final List<User>? narasumber;
  @override
  final List<User>? pendaftar;

  @override
  String toString() {
    return 'Event(id: $id, nama: $nama, deskripsi: $deskripsi, kuota: $kuota, tanggal: $tanggal, jamMulai: $jamMulai, jamSelesai: $jamSelesai, link: $link, penyelenggara: $penyelenggara, narasumber: $narasumber, pendaftar: $pendaftar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nama, nama) &&
            const DeepCollectionEquality().equals(other.deskripsi, deskripsi) &&
            const DeepCollectionEquality().equals(other.kuota, kuota) &&
            const DeepCollectionEquality().equals(other.tanggal, tanggal) &&
            const DeepCollectionEquality().equals(other.jamMulai, jamMulai) &&
            const DeepCollectionEquality()
                .equals(other.jamSelesai, jamSelesai) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality()
                .equals(other.penyelenggara, penyelenggara) &&
            const DeepCollectionEquality()
                .equals(other.narasumber, narasumber) &&
            const DeepCollectionEquality().equals(other.pendaftar, pendaftar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nama),
      const DeepCollectionEquality().hash(deskripsi),
      const DeepCollectionEquality().hash(kuota),
      const DeepCollectionEquality().hash(tanggal),
      const DeepCollectionEquality().hash(jamMulai),
      const DeepCollectionEquality().hash(jamSelesai),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(penyelenggara),
      const DeepCollectionEquality().hash(narasumber),
      const DeepCollectionEquality().hash(pendaftar));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {@JsonKey(name: 'webinar_id') required int id,
      @JsonKey(name: 'nama') required String nama,
      @JsonKey(name: 'deskripsi') required String deskripsi,
      @JsonKey(name: 'kuota') required int kuota,
      @JsonKey(name: 'tanggal') required String tanggal,
      @JsonKey(name: 'jam_mulai') required String jamMulai,
      @JsonKey(name: 'jam_selesai') required String jamSelesai,
      @JsonKey(name: 'link') required String link,
      @JsonKey(name: 'penyelenggara') required User penyelenggara,
      @JsonKey(name: 'narasumber') List<User>? narasumber,
      List<User>? pendaftar}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: 'webinar_id')
  int get id;
  @override
  @JsonKey(name: 'nama')
  String get nama;
  @override
  @JsonKey(name: 'deskripsi')
  String get deskripsi;
  @override
  @JsonKey(name: 'kuota')
  int get kuota;
  @override
  @JsonKey(name: 'tanggal')
  String get tanggal;
  @override
  @JsonKey(name: 'jam_mulai')
  String get jamMulai;
  @override
  @JsonKey(name: 'jam_selesai')
  String get jamSelesai;
  @override
  @JsonKey(name: 'link')
  String get link;
  @override
  @JsonKey(name: 'penyelenggara')
  User get penyelenggara;
  @override
  @JsonKey(name: 'narasumber')
  List<User>? get narasumber;
  @override
  List<User>? get pendaftar;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
