import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';

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
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String notelp;
  @HiveField(3)
  final String password;

  UserLoggedInState({
    required this.name,
    required this.email,
    required this.notelp,
    required this.password,
  });

  UserLoggedInState copyWith({
    String? name,
    String? email,
    String? notelp,
    String? password,
  }) {
    return UserLoggedInState(
      name: name ?? this.name,
      email: email ?? this.email,
      notelp: notelp ?? this.notelp,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'no_telp': notelp,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [name, email, notelp, password];
}
