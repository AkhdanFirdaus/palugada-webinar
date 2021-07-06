import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
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

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              _LoginGuestWidget("Nama Depan", "Nama Belakang", 3),
              SizedBox(height: 38),
              Divider(),
              SizedBox(height: 38),
              _LoginWidget(3),
              SizedBox(height: 38),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginWidget extends HookConsumerWidget {
  _LoginWidget(this.role);
  final int role;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isValid2 = useState<bool>(false);
    final isVisible = useState<bool>(false);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        isValid2.value = emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sudah Punya Akun?",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text("Masuk Disini"),
          SizedBox(height: 38),
          Text("Email"),
          SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
          ),
          SizedBox(height: 18),
          Text("Sandi"),
          SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.done,
            controller: passwordController,
            obscureText: !isVisible.value,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  isVisible.value = !isVisible.value;
                },
                icon:
                    isVisible.value ? Icon(Icons.lock_open) : Icon(Icons.lock),
              ),
            ),
          ),
          SizedBox(height: 18),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: isValid2.value
                    ? () {
                        ref
                            .read(userProvider.notifier)
                            .loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            )
                            .then((value) async {
                          if (value.role == role) {
                            MotionToast.success(
                              title: "Sukses Login",
                              description: "Halo ${value.name}",
                              toastDuration: Duration(seconds: 2),
                            ).show(context);
                            Future.delayed(Duration(seconds: 2), () {
                              ref.read(userProvider.notifier).loadUser(value);
                            });
                          } else {
                            MotionToast.error(
                              title: "Gagal Login",
                              description:
                                  "Anda bukan ${role == 1 ? 'Penyelenggara' : 'Peserta'}",
                              toastDuration: Duration(seconds: 2),
                            ).show(context);
                          }
                        }).catchError((e) {
                          MotionToast.error(
                            title: "Gagal Login",
                            description: e.toString(),
                            toastDuration: Duration(seconds: 2),
                          ).show(context);
                        });
                      }
                    : null,
                child: Text("Masuk"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoginGuestWidget extends HookConsumerWidget {
  _LoginGuestWidget(this.labelNama, this.labelAsal, this.role);
  final String labelNama;
  final String labelAsal;
  final int role;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final isValid = useState<bool>(false);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        isValid.value = firstNameController.text.isNotEmpty &&
            lastNameController.text.isNotEmpty;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelNama),
          SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: firstNameController,
          ),
          SizedBox(height: 18),
          Text(labelAsal),
          SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.done,
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
                              role: role,
                            );
                        Future.delayed(Duration(seconds: 1));
                        context.router.root.replace(
                          HomeRouter(
                            children: [
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
        ],
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
            _LoginGuestWidget("Nama Penyelenggara", "Institusi", 1),
            SizedBox(height: 38),
            Divider(),
            SizedBox(height: 38),
            _LoginWidget(1),
            SizedBox(height: 38),
          ],
        ),
      ),
    );
  }
}
