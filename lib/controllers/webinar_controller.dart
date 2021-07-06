import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/webinar.dart';
import '../utils/network/api.dart';

final webinarProvider =
    StateNotifierProvider<WebinarNotifier, List<WebinarState>?>((ref) {
  final _api = ref.read(apiProvider);
  return WebinarNotifier(_api);
});

class WebinarNotifier extends StateNotifier<List<WebinarState>?> {
  WebinarNotifier(this.api, [List<WebinarState>? state]) : super([]);

  final Dio api;

  void getWebinar() async {
    final response = await api.get(ApiConstants.webinar);
    print(response);
    state = (response.data['data'] as List)
        .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
        .toList();
  }

  void search(String search) {
    state = state?.where((webinar) {
      return webinar.nama.contains(search);
    }).toList();
  }
}

final webinarFutureProvider = FutureProvider<List<WebinarState>>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.webinar);
  return (response.data['data'] as List)
      .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
      .toList();
});

final webinarDetailFutureProvider =
    FutureProviderFamily<WebinarState, int>((ref, id) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.webinar + "/$id");
  return WebinarState.fromJson(response.data['data'] as Json);
});
