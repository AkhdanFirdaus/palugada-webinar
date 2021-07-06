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

  UserGuestState({this.firstName, this.lastName});

  @override
  List<Object?> get props => [firstName, lastName];
}

@HiveType(typeId: 1)
class UserLoggedInState extends Equatable implements UserState {
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

  UserLoggedInState({
    required this.id,
    required this.name,
    required this.email,
    required this.notelp,
    required this.asal,
    required this.role,
  });

  UserLoggedInState copyWith({
    int? id,
    String? name,
    String? email,
    String? notelp,
    String? password,
    String? asal,
    int? role,
  }) {
    return UserLoggedInState(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      notelp: notelp ?? this.notelp,
      asal: asal ?? this.asal,
      role: role ?? this.role,
    );
  }

  factory UserLoggedInState.fromJson(Json json) {
    return UserLoggedInState(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      notelp: json['nomor_telp'],
      asal: json['asal'],
      role: json['role'],
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
    };
  }

  @override
  List<Object?> get props => [id, name, email, notelp, asal, role];
}
