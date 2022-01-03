import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../auth/models/user.dart';

final narasumberProvider =
    StateNotifierProvider<NarasumberNotifier, List<User>>((ref) {
  return NarasumberNotifier();
});

class NarasumberNotifier extends StateNotifier<List<User>> {
  NarasumberNotifier([List<User>? state])
      : super([User(asal: "", email: "", name: "", notelp: "")]);

  void addNarasumber() {
    state = [...state, User(asal: "", email: "", name: "", notelp: "")];
  }

  void removeNarasumber(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void setAsal(int index, String asal) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (index == i) state[i].copyWith(asal: asal) else state[i]
    ];
  }

  void setEmail(int index, String email) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (index == i) state[i].copyWith(email: email) else state[i]
    ];
  }

  void setNama(int index, String name) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (index == i) state[i].copyWith(name: name) else state[i]
    ];
  }

  void setNoTelp(int index, String notelp) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (index == i) state[i].copyWith(notelp: notelp) else state[i]
    ];
  }
}
