import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/utils/network/api.dart';

final countWebinarProvider = FutureProvider<int>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.countWebinar);
  return response.data['count'] as int;
});

final countPendaftarProvider = FutureProvider<int>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.countPendaftar);
  return response.data['count'] as int;
});

final countMyWebinarProvider = FutureProvider.family<int, int>((ref, id) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.countMyWebinar(id));
  return response.data['count'] as int;
});
