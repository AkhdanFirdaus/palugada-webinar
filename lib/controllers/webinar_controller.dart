import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/models/user.dart';

import '../models/webinar.dart';
import '../utils/network/api.dart';

typedef Json = Map<String, dynamic>;

final webinarProvider = Provider<WebinarController>((ref) {
  final api = ref.watch(apiProvider);
  return WebinarController(api);
});

class WebinarController {
  WebinarController(this.api);
  final Dio api;

  Future<String> registerWebinar(int webinarId, int userId) async {
    try {
      final response = await api.post(ApiConstants.registerWebinar, data: {
        'webinar_id': webinarId,
        'user_id': userId,
      });
      if (response.statusCode == 200) {
        return response.data['message'] as String;
      } else {
        throw ErrorMessage(response.data['message'] as String);
      }
    } catch (e) {
      throw ErrorMessage(e.toString());
    }
  }

  Future<String> createWebinar(
    String nama,
    String deskripsi,
    int kuota,
    String tanggal,
    String jamMulai,
    int penyelenggaraId,
    String link,
    String jamSelesai,
    List<User> users,
  ) async {
    try {
      final response = await api.post(ApiConstants.createWebinar, data: {
        'nama': nama,
        'deskripsi': deskripsi,
        'kuota': kuota,
        'tanggal': tanggal,
        'jam_mulai': jamMulai,
        'jam_selesai': jamSelesai,
        'penyelenggara_id': penyelenggaraId,
        'link': link,
        'narasumber': List<dynamic>.from(users.map((x) => x.toJson())),
      });
      return response.data['message'] as String;
    } catch (e) {
      throw ErrorMessage('Gagal membuat Webinar');
    }
  }
}

final webinarFutureProvider = FutureProvider<List<WebinarState>>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.webinar);
  return (response.data['data'] as List)
      .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
      .toList();
});

final myWebinarFutureProvider =
    FutureProviderFamily<List<WebinarState>, int>((ref, userId) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.myWebinar(userId));
  return (response.data['data'] as List)
      .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
      .toList();
});

final joinedWebinarFutureProvider =
    FutureProviderFamily<List<WebinarState>, int>((ref, userId) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.joinedWebinar(userId));
  return (response.data['data'] as List)
      .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
      .toList();
});

final webinarPenyelenggaraFutureProvider =
    FutureProviderFamily<List<WebinarState>, int>((ref, userId) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.penyelenggaraWebinar(userId));
  return (response.data['data'] as List)
      .map<WebinarState>((e) => WebinarState.fromJson(e as Json))
      .toList();
});

final webinarDetailFutureProvider =
    FutureProviderFamily<WebinarState, int>((ref, id) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.webinarDetail(id));
  return WebinarState.fromJson(response.data['data'] as Json);
});
