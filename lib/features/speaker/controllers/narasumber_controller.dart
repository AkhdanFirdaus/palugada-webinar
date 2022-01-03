import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../auth/models/user.dart';

final speakerProvider =
    StateNotifierProvider<SpeakerNotifier, List<User>>((ref) {
  return SpeakerNotifier();
});

class SpeakerNotifier extends StateNotifier<List<User>> {
  SpeakerNotifier([List<User>? state])
      : super([User(asal: "", email: "", name: "", notelp: "")]);

  void addSpeaker() {
    state = [...state, User(asal: "", email: "", name: "", notelp: "")];
  }

  void removeSpeaker(int index) {
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
