import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/webinar_controller.dart';
import 'package:auto_route/auto_route.dart';

class WebinarDetailPage extends HookConsumerWidget {
  WebinarDetailPage({@PathParam('webinarId') required this.webinarId});
  final int webinarId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webinar = ref.watch(webinarDetailFutureProvider(webinarId));
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: webinar.when(
          data: (data) {
            return ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 38),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: Card(
                      child: BackButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        color: Colors.black,
                      ),
                    ),
                    title: Text(
                      data.nama,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    centerTitle: true,
                  ),
                ),
                SizedBox(height: 38),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Card(
                        child: InkWell(
                          child: SizedBox(
                            height: 320,
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Center(
                                child: Text("Gambar"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.tanggal,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text(
                                  data.jamMulai,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Text(
                                    "Kuota Peserta",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(height: 8),
                                  Chip(
                                    label: Text(data.kuota.toString()),
                                    backgroundColor: Colors.blue,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Kuota Tersisa",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(height: 8),
                                  Chip(
                                    label: Text("3"),
                                    backgroundColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 38),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deskripsi Webinar"),
                      SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            data.deskripsi,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Narasumber"),
                      SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              for (final narasumber in data.narasumber!)
                                ListTile(
                                  title: Text(narasumber.name),
                                  subtitle: Text(narasumber.asal),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Penyelenggara"),
                      SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.apartment),
                          title: Text(data.penyelenggara.name),
                          trailing: Chip(label: Text("3")),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Link Webinar"),
                      SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text("link"),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.copy),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Daftar"),
                  ),
                ),
              ],
            );
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          error: (e, s) {
            return Text(e.toString());
          },
        ),
      ),
    );
  }
}
