import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/user_controller.dart';
import 'package:palugada/models/user.dart';
import '../utils/routes/router.gr.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsets.only(bottom: 20),
              child: Consumer(
                builder: (context, ref, child) {
                  final userState = ref.watch(userProvider);
                  if (userState is UserGuestState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Halo " + userState.firstName! + "!",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.router.push(UserRegisterRouter());
                          },
                          child: Text(
                            "Anda belum terdaftar, klik disini untuk daftar",
                          ),
                        ),
                      ],
                    );
                  } else {
                    userState as UserLoggedInState;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CircleAvatar(
                            child: Text("AMF"),
                            minRadius: 120,
                            maxRadius: 120,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 20,
                          width: 38,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userState.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(userState.email),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            Card(
              color: Color(0xffFA3085),
              child: ExpansionTile(
                backgroundColor: Color(0xffFA3085),
                leading: Text("3"),
                title: Text("Favorit"),
                children: List.generate(3, (index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        context.router.push(
                          WebinarDetailRoute(webinarId: index),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 72,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Placeholder(),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title $index",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    "Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet.",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                ButtonBar(
                                  children: [
                                    Chip(
                                      label: Text("20 Juli"),
                                    ),
                                    Chip(
                                      label: Text("Kuota 20"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 28),
            Card(
              color: Color(0xff716EFF),
              child: ExpansionTile(
                backgroundColor: Color(0xff716EFF),
                leading: Text("3"),
                title: Text("Webinar Diikuti"),
                children: List.generate(3, (index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        context.router.push(
                          WebinarDetailRoute(webinarId: index),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 72,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Placeholder(),
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title $index",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                SizedBox(
                                  width: 160,
                                  child: Text(
                                    "Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet.",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                                ButtonBar(
                                  children: [
                                    Chip(
                                      label: Text("20 Juli"),
                                    ),
                                    Chip(
                                      label: Text("Kuota 20"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 28),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  context.router.root.replace(ChooseRouter()).whenComplete(() {
                    ref.read(userProvider.notifier).logout();
                  });
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text("Logout"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
