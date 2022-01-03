import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../auth/index.dart';
import '../../event/widgets/event_list_widget.dart';
import '../controllers/event-organizer_controller.dart';

class EventOrganizerDetailPage extends HookConsumerWidget {
  EventOrganizerDetailPage(
      {@PathParam('penyelenggaraId') required this.penyelenggaraId});
  final int penyelenggaraId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final penyelenggara =
        ref.watch(eventOrganizerDetailFutureProvider(penyelenggaraId));
    final userId = (ref.watch(userProvider) as User).id ?? -1;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: penyelenggara.when(
          data: (data) {
            return RefreshIndicator(
              onRefresh: () {
                ref.refresh(
                    eventOrganizerDetailFutureProvider(penyelenggaraId));
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
                  Card(
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
                  SizedBox(height: 38),
                  Builder(builder: (context) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          if (userId != -1 || userId != data.id) {
                            ref
                                .read(userProvider.notifier)
                                .favorite(userId, data.id!)
                                .then((value) {
                              MotionToast.success(
                                title: "Sukses",
                                description: value,
                              ).show(context);
                            }).catchError((error) {
                              MotionToast.error(
                                title: "Error",
                                description: error.toString(),
                              ).show(context);
                            });
                          }
                        },
                        title: Text("${data.countWebinar} webinar"),
                        trailing: Icon(Icons.favorite),
                      ),
                    );
                  }),
                  EventListWidget(data.id!),
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
