import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/count_controller.dart';
import '../controllers/user_controller.dart';
import '../controllers/webinar_controller.dart';
import '../models/user.dart';
import '../utils/constants/enums.dart';
import '../utils/routes/router.gr.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 38),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Cari Webinar",
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          SizedBox(height: 38),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/banner.png'),
          ),
          Container(
            color: Color(0xff716EFF),
            height: MediaQuery.of(context).size.height * 0.18,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      final count = ref.watch(countWebinarProvider);
                      return count.when(
                        data: (data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "Webinar",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          );
                        },
                        loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        error: (e, s) {
                          return Center(
                            child: Text("error"),
                          );
                        },
                      );
                    },
                  ),
                  VerticalDivider(),
                  Consumer(
                    builder: (context, ref, child) {
                      final count = ref.watch(countPendaftarProvider);
                      return count.when(
                        data: (data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "Pendaftar",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          );
                        },
                        loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        error: (e, s) {
                          return Center(
                            child: Text("error"),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 38),
          _InfoAction(),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Terdekat",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text("Buat kamu pasukan sistem kebut semalam"),
                SizedBox(height: 18),
                Consumer(
                  builder: (context, ref, widget) {
                    final webinarList = ref.watch(webinarFutureProvider);
                    return webinarList.when(data: (data) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final webinar in data)
                              SizedBox(
                                height: 180,
                                child: Card(
                                  child: InkWell(
                                    onTap: () {
                                      context.navigateTo(
                                        WebinarRouter(children: [
                                          WebinarDetailRoute(
                                              webinarId: webinar.id)
                                        ]),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1,
                                            child: Placeholder(),
                                          ),
                                          SizedBox(width: 12),
                                          SizedBox(
                                            width: 200,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  webinar.nama,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                                Text(
                                                  webinar.deskripsi,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      );
                    }, loading: () {
                      return SizedBox(
                        height: 180,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }, error: (e, s) {
                      return SizedBox(
                        height: 180,
                        child: Text(e.toString()),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Trending",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text("Event buat kamu yang trendi"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index) {
                      return SizedBox(
                        height: 180,
                        child: Card(
                          child: InkWell(
                            onTap: () {
                              context.router
                                  .push(WebinarDetailRoute(webinarId: index));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Placeholder(),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title $index",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          "Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
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
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    if (user is UserLoggedInState) {
      if (user.role == 1) {
        return Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  color: Colors.blue,
                  child: InkWell(
                    onTap: () {
                      context.router.push(WebinarCreateRouter());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.add,
                            size: 36,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Buat Webinar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.pinkAccent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 36,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Favorit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: Card(
                      color: Colors.teal,
                      child: InkWell(
                        onTap: () {
                          context.router.push(JoinedWebinarRouter(
                            type: webinarType.my,
                            userId: user.id,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 36,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Dibuat",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.pinkAccent,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 36,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Favorit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: Card(
                    color: Colors.teal,
                    child: InkWell(
                      onTap: () {
                        context.router.push(JoinedWebinarRouter(
                          type: webinarType.joined,
                          userId: user.id,
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.list,
                              size: 36,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Diikuti",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return SizedBox();
  }
}
