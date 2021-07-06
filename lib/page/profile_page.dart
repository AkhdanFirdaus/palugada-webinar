import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/user_controller.dart';
import 'package:palugada/models/user.dart';
import '../utils/routes/router.gr.dart';

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
                          (userState as UserLoggedInState).name,
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
                      Text(userState.role == 1 ? "Institusi" : "Asal"),
                      SizedBox(height: 8),
                      Card(
                        child: ListTile(title: Text(userState.asal)),
                      ),
                      SizedBox(height: 38),
                      Text("Nomor Telepon"),
                      SizedBox(height: 8),
                      Card(
                        child: ListTile(title: Text(userState.notelp)),
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
