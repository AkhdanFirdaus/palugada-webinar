import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/user_controller.dart';
import '../utils/routes/router.gr.dart';

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "Palugada",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text("Webinar Serba Ada"),
            Spacer(),
            Expanded(
              flex: 3,
              child: Card(
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    context.router.push(UserLoginRouter());
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.school,
                          size: 48,
                        ),
                        Text("Saya Peserta"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Card(
                color: Colors.teal.shade200,
                child: InkWell(
                  onTap: () {
                    context.router.push(CreatorLoginRouter());
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.apartment,
                          size: 48,
                        ),
                        Text("Saya Penyelenggara"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class UserLoginPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final isValid = useState<bool>(false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(24.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              isValid.value = firstNameController.text.isNotEmpty &&
                  lastNameController.text.isNotEmpty;
            },
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 38),
                    child: Card(child: BackButton()),
                  ),
                ),
                SizedBox(height: 38),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.school,
                            size: 48,
                          ),
                          Text("Saya Peserta"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 38),
                Text("Nama Depan"),
                SizedBox(height: 8),
                TextFormField(
                  controller: firstNameController,
                ),
                SizedBox(height: 18),
                Text("Nama Belakang"),
                SizedBox(height: 8),
                TextFormField(
                  controller: lastNameController,
                ),
                SizedBox(height: 18),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: isValid.value
                          ? () {
                              ref.read(userProvider.notifier).loginGuest(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                  );
                              Future.delayed(Duration(seconds: 1));
                              context.router.root.replace(
                                HomeRoute(
                                  children: [
                                    WebinarRouter(),
                                    ProfileRouter(),
                                    InfoRouter(),
                                  ],
                                ),
                              );
                            }
                          : null,
                      child: Text("Masuk"),
                    ),
                  ],
                ),
                SizedBox(height: 38),
                Divider(),
                SizedBox(height: 38),
                Text(
                  "Sudah Punya Akun?",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text("Masuk Disini"),
                SizedBox(height: 38),
                SizedBox(height: 38),
                Text("Email"),
                SizedBox(height: 8),
                TextFormField(),
                SizedBox(height: 18),
                Text("Sandi"),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                ),
                SizedBox(height: 18),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.router.root.replace(
                          HomeRoute(
                            children: [
                              WebinarRouter(),
                              ProfileRouter(),
                              InfoRouter(),
                            ],
                          ),
                        );
                      },
                      child: Text("Masuk"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreatorLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 38),
                child: Card(child: BackButton()),
              ),
            ),
            SizedBox(height: 38),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                color: Colors.teal.shade200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.apartment,
                        size: 48,
                      ),
                      Text("Penyelenggara"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 38),
            Text("Nama Penyelenggara"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            Text("Institusi"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.router.root.replace(
                      HomeRoute(
                        children: [
                          WebinarRouter(),
                          ProfileRouter(),
                          InfoRouter(),
                        ],
                      ),
                    );
                  },
                  child: Text("Masuk"),
                ),
              ],
            ),
            SizedBox(height: 38),
            Divider(),
            SizedBox(height: 38),
            Text(
              "Sudah Punya Akun?",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text("Masuk Disini"),
            SizedBox(height: 38),
            Text("Email"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            Text("Sandi"),
            SizedBox(height: 8),
            TextFormField(
              obscureText: true,
            ),
            SizedBox(height: 18),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.router.root.replace(
                      HomeRoute(
                        children: [
                          WebinarRouter(),
                          InfoRouter(),
                          ProfileRouter(),
                        ],
                      ),
                    );
                  },
                  child: Text("Masuk"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
