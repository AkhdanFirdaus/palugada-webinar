import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:palugada/controllers/user_controller.dart';
import 'package:palugada/models/user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:palugada/utils/routes/router.gr.dart';

class RegisterPage extends HookConsumerWidget {
  RegisterPage(this.role);
  final int role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaController = useTextEditingController();
    final asalController = useTextEditingController();
    final telpController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVisible = useState<bool>(false);
    final isValid = useState<bool>(false);

    useEffect(() {
      final guest = ref.read(userProvider) as UserGuestState;
      if (role == 1) {
        namaController..text = guest.firstName!;
        asalController..text = guest.lastName!;
      } else {
        namaController..text = guest.firstName! + " " + guest.lastName!;
      }
      return null;
    }, []);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            isValid.value = namaController.text.isNotEmpty &&
                asalController.text.isNotEmpty &&
                telpController.text.isNotEmpty &&
                emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty;
          },
          child: ListView(
            children: [
              AppBar(
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
                  role == 1 ? "Daftar Peserta" : "Daftar Penyelenggara",
                  style: Theme.of(context).textTheme.headline5,
                ),
                centerTitle: true,
              ),
              SizedBox(height: 38),
              Text("Nama"),
              SizedBox(height: 8),
              TextFormField(
                controller: namaController,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 38),
              Text(role == 1 ? "Institusi" : "Asal"),
              SizedBox(height: 8),
              TextFormField(
                controller: asalController,
                maxLines: null,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 38),
              Text("No. Telpon"),
              SizedBox(height: 8),
              TextFormField(
                controller: telpController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 38),
              Text("Email"),
              SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 38),
              Text("Password"),
              SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                obscureText: !passwordVisible.value,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
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
                  Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: isValid.value
                          ? () {
                              ref
                                  .read(userProvider.notifier)
                                  .registerUser(
                                    name: namaController.text,
                                    email: emailController.text,
                                    nomorTelp: telpController.text,
                                    password: passwordController.text,
                                    asal: asalController.text,
                                    role: role,
                                  )
                                  .then((value) {
                                MotionToast.success(
                                  title: "Sukses Register",
                                  description: "Halo ${value.name}",
                                  toastDuration: Duration(seconds: 2),
                                ).show(context);
                                Future.delayed(Duration(seconds: 2), () {
                                  ref
                                      .read(userProvider.notifier)
                                      .loadUser(value);
                                });
                              }).catchError((e) {
                                MotionToast.error(
                                  title: "Gagal Daftar",
                                  description: e.toString(),
                                  toastDuration: Duration(seconds: 2),
                                ).show(context);
                              });
                            }
                          : null,
                      child: Text("Submit"),
                    ),
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
