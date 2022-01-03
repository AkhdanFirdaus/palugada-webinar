import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constants/persistence_constants.dart';
import '../../../core/network/api.dart';
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

  void loadUser(UserState data) {
    Hive.box<UserState>(PersistenceConstants.userBox).put('cachedUser', data);
    if (data is UserGuestState) {
      state = data;
    } else {
      state = (data as User).copyWith(
        id: data.id,
        name: data.name,
        asal: data.asal,
        email: data.email,
        notelp: data.notelp,
        role: data.role,
      );
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

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await api.post(ApiConstants.login, data: {
      'email': email,
      'password': password,
    });
    try {
      final user = User.fromJson(response.data['data']);
      return user;
    } catch (_) {
      throw ErrorMessage("Invalid credential");
    }
  }

  Future<User> loginWithId(int id) async {
    final response = await api.post(ApiConstants.loginWithId, data: {
      'user_id': id,
    });
    try {
      final user = User.fromJson(response.data['data']);
      return user;
    } catch (_) {
      throw ErrorMessage("User Not Found");
    }
  }

  Future<User> registerUser({
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

  void logout() async {
    Hive.box<UserState>(PersistenceConstants.userBox).clear();
    state = null;
  }

  Future<String> favorite(int userId, int penyelenggaraId) async {
    try {
      final response = await api.post(ApiConstants.favorite, data: {
        'user_id': userId,
        'penyelenggara_id': penyelenggaraId,
      });
      return response.data['message'] as String;
    } catch (e) {
      throw ErrorMessage("Gagal Favorite");
    }
  }
}

final favoriteUserFutureProvider =
    FutureProviderFamily<List<User>, int>((ref, userId) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.favoriteWebinar(userId));
  return (response.data['data'] as List)
      .map<User>((e) => User.fromJson(e as Json))
      .toList();
});
