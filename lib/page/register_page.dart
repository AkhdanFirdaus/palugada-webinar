import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/user_controller.dart';
import 'package:palugada/models/user.dart';

class UserRegisterPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(userProvider) as UserGuestState;
    final namaController = useTextEditingController()
      ..text = guest.firstName! + " " + guest.lastName!;
    final telpController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVisible = useState<bool>(false);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {},
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
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama",
                ),
              ),
              SizedBox(height: 38),
              TextFormField(
                controller: telpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "No. Telpon",
                ),
              ),
              SizedBox(height: 38),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              SizedBox(height: 38),
              TextFormField(
                controller: passwordController,
                obscureText: !passwordVisible.value,
                decoration: InputDecoration(
                  labelText: "Sandi",
                  suffixIcon: IconButton(
                    onPressed: () {
                      passwordVisible.value = !passwordVisible.value;
                    },
                    icon: !passwordVisible.value
                        ? Icon(Icons.lock)
                        : Icon(Icons.lock_open),
                  ),
                ),
              ),
              SizedBox(height: 38),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatorRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {},
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Institusi",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "No. Telpon",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Sandi",
                ),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
