import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../index.dart';

class EventListWidget extends HookConsumerWidget {
  EventListWidget(this.userId);
  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webinarList = ref.watch(webinarPenyelenggaraFutureProvider(userId));
    return Card(
      child: webinarList.when(
        data: (data) {
          if (data.isNotEmpty) {
            return Column(
              children: [
                for (final webinar in data)
                  ListTile(
                    title: Text(webinar.nama),
                    subtitle: Text(
                      webinar.jamMulai +
                          "-" +
                          webinar.jamSelesai +
                          "\n" +
                          webinar.tanggal,
                    ),
                    isThreeLine: true,
                    trailing: Chip(
                      label: Text(webinar.kuota.toString()),
                    ),
                  ),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(child: Text("Tidak ada webinar")),
            );
          }
        },
        loading: () {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: CircularProgressIndicator()),
          );
        },
        error: (e, s) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Text(e.toString())),
          );
        },
      ),
    );
  }
}
