import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/utils/constants/persistence_constants.dart';
import 'package:palugada/utils/network/api.dart';

import '../models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState?>((ref) {
  final _api = ref.read(apiProvider);
  return UserNotifier(_api);
});

class UserNotifier extends StateNotifier<UserState?> {
  final Dio api;
  UserNotifier(this.api, [UserState? state])
      : super(Hive.box<UserState>(PersistenceConstants.userBox)
            .get('cachedUser'));

  void loadUser(UserState? data) {
    Box<UserState> box = Hive.box<UserState>(PersistenceConstants.userBox);
    box.put('cachedUser', data!);
    if (data is UserGuestState) {
      state = data;
    } else {
      state = data as UserLoggedInState;
    }
  }

  void loginGuest({required String firstName, required String lastName}) {
    final user = UserGuestState(
      firstName: firstName,
      lastName: lastName,
    );
    Box<UserState> box = Hive.box<UserState>(PersistenceConstants.userBox);
    box.put('cachedUser', user);
    state = user;
  }

  Future<UserLoggedInState> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await api.post(ApiConstants.login, data: {
      'email': email,
      'password': password,
    });
    try {
      final user = UserLoggedInState.fromJson(response.data['data']);
      return user;
    } catch (_) {
      throw ErrorMessage("Invalid credential");
    }
  }

  Future<bool> logout() async {
    state = null;
    Box<UserState> box = Hive.box<UserState>(PersistenceConstants.userBox);
    box.clear();
    return box.isEmpty;
  }

  Future<bool> registerUser({
    required String name,
    required String email,
    required String nomorTelp,
    required String password,
  }) async {
    final response = await api.post(ApiConstants.registerUser, data: {
      'name': name,
      'email': email,
      'nomor_telp': nomorTelp,
      'password': password,
    });

    final user = UserLoggedInState.fromJson(response.data['data']);
    Box<UserState> box = Hive.box<UserState>(PersistenceConstants.userBox);
    box.put('cachedUser', user);
    state = user;
    return state != null;
  }
}
