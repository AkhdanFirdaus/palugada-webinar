import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserState?> {
  UserNotifier([UserState? state]) : super(state);

  void loginGuest({required String firstName, required String lastName}) {
    state = UserGuestState(
      firstName: firstName,
      lastName: lastName,
    );
  }

  void loginUser({
    required String name,
    required String email,
    required String notelp,
    required String password,
  }) {
    state = UserLoggedInState(
      name: name,
      email: email,
      notelp: notelp,
      password: password,
    );
  }

  void logout() {
    state = null;
  }
}
