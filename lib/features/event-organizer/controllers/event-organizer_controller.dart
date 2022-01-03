import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/features/auth/index.dart';
import '../../../core/network/api.dart';

final eventOrganizerFutureProvider = FutureProvider<List<User>>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConstants.penyelenggara);
  return (response.data['data'] as List)
      .map<User>((e) => User.fromJson(e as Json))
      .toList();
});

final eventOrganizerDetailFutureProvider =
    FutureProviderFamily<User, int>((ref, penyelenggaraId) async {
  final api = ref.read(apiProvider);
  final response =
      await api.get(ApiConstants.penyelenggaraDetail(penyelenggaraId));
  return User.fromJson(response.data['data']);
});
