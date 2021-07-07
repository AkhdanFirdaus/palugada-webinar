import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../controllers/penyelenggara_controller.dart';

class PenyelenggaraDetailPage extends HookConsumerWidget {
  PenyelenggaraDetailPage(
      {@PathParam('penyelenggaraId') required this.penyelenggaraId});
  final int penyelenggaraId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final penyelenggara =
        ref.watch(penyelenggaraDetailFutureProvider(penyelenggaraId));
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: penyelenggara.when(
          data: (data) {
            return RefreshIndicator(
              onRefresh: () {
                ref.refresh(penyelenggaraDetailFutureProvider(penyelenggaraId));
                return Future.value();
              },
              child: ListView(
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
                        data.name,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      centerTitle: true,
                    ),
                  ),
                  SizedBox(height: 38),
                  Container(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.mail),
                            title: Text(data.email),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text(data.notelp),
                          ),
                          ListTile(
                            leading: Icon(Icons.apartment),
                            title: Text(
                              data.asal,
                              softWrap: true,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 38),
                  Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text("${data.countWebinar} webinar"),
                      trailing: Icon(Icons.favorite),
                    ),
                  ),
                ],
              ),
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
