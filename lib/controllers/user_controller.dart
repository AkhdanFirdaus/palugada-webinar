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
    Hive.box<UserState>(PersistenceConstants.userBox).put('cachedUser', data!);
    if (data is UserGuestState) {
      state = data;
    } else {
      state = data as UserLoggedInState;
    }
  }

  void loginGuest({
    required String firstName,
    required String lastName,
    required int role,
  }) {
    final user = UserGuestState(
      firstName: firstName,
      lastName: lastName,
      role: role,
    );
    Hive.box<UserState>(PersistenceConstants.userBox).put('cachedUser', user);
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

  Future<UserLoggedInState> loginWithId(int id) async {
    final response = await api.post(ApiConstants.loginWithId, data: {
      'user_id': id,
    });
    try {
      final user = UserLoggedInState.fromJson(response.data['data']);
      return user;
    } catch (_) {
      throw ErrorMessage("User Not Found");
    }
  }

  Future<bool> logout() async {
    state = null;
    Hive.box<UserState>(PersistenceConstants.userBox).clear();
    return state != null;
  }

  Future<UserLoggedInState> registerUser({
    required String name,
    required String email,
    required String nomorTelp,
    required String password,
    required String asal,
    required int role,
  }) async {
    try {
      final response = await api.post(ApiConstants.register, data: {
        'name': name,
        'nomor_telp': nomorTelp,
        'email': email,
        'password': password,
        'asal': asal,
        'role': role,
      });

      if (response.statusCode == 200) {
        final user = await loginWithId(response.data['user_id'] as int);
        return user;
      } else {
        throw ErrorMessage(response.data['message'] as String);
      }
    } catch (e) {
      throw ErrorMessage("Gagal register");
    }
  }
}
