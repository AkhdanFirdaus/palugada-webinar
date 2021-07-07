import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user.g.dart';

typedef Json = Map<String, dynamic>;

final userState = Provider<UserState>((ref) {
  return UserGuestState();
});

abstract class UserState {}

@HiveType(typeId: 0)
class UserGuestState extends Equatable implements UserState {
  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final int? role;

  UserGuestState({this.firstName, this.lastName, this.role});

  @override
  List<Object?> get props => [firstName, lastName, role];
}

@HiveType(typeId: 1)
class User extends Equatable implements UserState {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String notelp;
  @HiveField(4)
  final String asal;
  @HiveField(5)
  final int role;
  final int? countWebinar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.notelp,
    required this.asal,
    required this.role,
    this.countWebinar,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? notelp,
    String? password,
    String? asal,
    int? role,
    int? countWebinar,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      notelp: notelp ?? this.notelp,
      asal: asal ?? this.asal,
      role: role ?? this.role,
      countWebinar: countWebinar ?? this.countWebinar,
    );
  }

  factory User.fromJson(Json json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      notelp: json['nomor_telp'],
      asal: json['asal'],
      role: json['role'],
      countWebinar: json['count_webinar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'name': name,
      'email': email,
      "nomor_telp": notelp,
      "asal": asal,
      "role": role,
      "count_webinar": countWebinar,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        notelp,
        asal,
        role,
        countWebinar,
      ];
}
