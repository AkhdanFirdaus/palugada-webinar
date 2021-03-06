import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/features/auth/models/user.dart';

import '../../../core/routes/router.dart';
import '../controllers/user_controller.dart';

class ProfilePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 36),
            child: Builder(
              builder: (context) {
                if (userState is UserGuestState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: Text(
                          "Halo " + userState.firstName! + "!",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Chip(
                        label: Text(
                          userState.role == 1 ? "Penyelenggara" : "Peserta",
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        backgroundColor: userState.role == 1
                            ? Color(0xff716FFF)
                            : Colors.pinkAccent,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          int role = userState.role!;
                          context.router.push(RegisterRouter(role: role));
                        },
                        child: Text(
                          "Anda belum terdaftar, klik disini untuk daftar",
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          (userState as User).name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(userState.email),
                        trailing: Chip(
                          label: Text(
                            userState.role == 1 ? "Penyelenggara" : "Peserta",
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          backgroundColor: userState.role == 1
                              ? Color(0xff716FFF)
                              : Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: 38),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: Icon(Icons.mail),
                              title: Text(userState.email),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(userState.notelp),
                            ),
                            ListTile(
                              leading: Icon(Icons.apartment),
                              title: Text(
                                userState.asal,
                                softWrap: true,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          SizedBox(height: 28),
          ElevatedButton(
            onPressed: () {
              context.router.root.replace(ChooseRouter()).whenComplete(() {
                ref.read(userProvider.notifier).logout();
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text("Logout"),
          ),
        ]),
      ),
    );
  }
}
