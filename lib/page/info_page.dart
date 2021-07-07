import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/count_controller.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';
import '../utils/constants/enums.dart';
import '../utils/routes/router.gr.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 38),
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _InfoAction(),
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
    if (user is User) {
      return GridView.count(
        childAspectRatio: 4 / 3,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Card(
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
          Card(
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
          Card(
            child: InkWell(
              onTap: () {
                context.router.push(PenyelenggaraRouter());
              },
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.apartment,
                      size: 36,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Penyelenggara",
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (user.role == 1)
            Card(
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
        ],
      );
    }
    return Center(child: Text("Daftar untuk melihat menu"));
  }
}
