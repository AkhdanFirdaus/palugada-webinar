import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../auth/index.dart';
import '../../speaker/controllers/narasumber_controller.dart';
import '../controllers/event_controller.dart';

class WebinarCreate extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaController = useTextEditingController();
    final deskripsiController = useTextEditingController();
    final kuotaController = useTextEditingController();
    final linkController = useTextEditingController();
    final tanggalController = useTextEditingController();
    final jamMulaiController = useTextEditingController();
    final jamSelesaiController = useTextEditingController();

    final listNarasumber = ref.watch(speakerProvider);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 38),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Card(
                  child: BackButton(
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  "Buat Event",
                  style: Theme.of(context).textTheme.headline5,
                ),
                centerTitle: true,
              ),
            ),
            SizedBox(height: 38),
            Text("Gambar/Pamflet"),
            SizedBox(height: 8),
            Card(
              child: InkWell(
                child: SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text("Upload Disini"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text("Nama Webinar"),
            SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: namaController,
            ),
            SizedBox(height: 18),
            Text("Deskripsi Webinar"),
            SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              minLines: 4,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: deskripsiController,
            ),
            SizedBox(height: 18),
            Text("Tanggal Webinar"),
            SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: tanggalController,
              readOnly: true,
              keyboardType: TextInputType.datetime,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030, 12, 31),
                ).then((value) {
                  if (value != null) {
                    tanggalController.text =
                        DateFormat("y-MM-dd").format(value);
                  }
                });
              },
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jam Mulai"),
                      SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: jamMulaiController,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            if (value != null) {
                              jamMulaiController.text = value.format(context);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jam Selesai"),
                      SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: jamSelesaiController,
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            if (value != null) {
                              jamSelesaiController.text = value.format(context);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text("Kuota"),
            SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: kuotaController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18),
            Text("Link Webinar"),
            SizedBox(height: 8),
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: linkController,
            ),
            SizedBox(height: 18),
            Text("Narasumber"),
            SizedBox(height: 8),
            for (int i = 0; i < listNarasumber.length; i++)
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Narasumber 1"),
                      SizedBox(height: 18),
                      TextField(
                        // controller: namaNarasumberController,
                        decoration: InputDecoration(labelText: "Nama"),
                        onChanged: (val) {
                          ref.read(speakerProvider.notifier).setNama(i, val);
                        },
                      ),
                      SizedBox(height: 18),
                      TextField(
                        // controller: emailNarasumberController,
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          ref.read(speakerProvider.notifier).setEmail(i, val);
                        },
                      ),
                      SizedBox(height: 18),
                      TextField(
                        // controller: noTelpNarasumberController,
                        decoration: InputDecoration(labelText: "Nomor Telp"),
                        keyboardType: TextInputType.phone,
                        onChanged: (val) {
                          ref.read(speakerProvider.notifier).setNoTelp(i, val);
                        },
                      ),
                      SizedBox(height: 18),
                      TextField(
                        // controller: asalNarasumberController,
                        decoration: InputDecoration(labelText: "Asal"),
                        onChanged: (val) {
                          ref.read(speakerProvider.notifier).setAsal(i, val);
                        },
                      ),
                      SizedBox(height: 18),
                      Builder(
                        builder: (context) {
                          if (i == listNarasumber.length - 1) {
                            return ButtonBar(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    print("add");
                                    print(listNarasumber.length);
                                    ref
                                        .read(speakerProvider.notifier)
                                        .addSpeaker();
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ],
                            );
                          } else {
                            return ButtonBar(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(speakerProvider.notifier)
                                        .removeSpeaker(i);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 18),
            Builder(
              builder: (context) {
                return FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // print("Nama: " + namaController.text);
                      // print("Deskripsi: " + deskripsiController.text);
                      // print("Tanggal: " + tanggalController.text);
                      // print("Jam: " +
                      //     jamMulaiController.text +
                      //     " s.d. " +
                      //     jamSelesaiController.text);
                      // print("Kuota: " + kuotaController.text);
                      // print("Link: " + linkController.text);
                      // listNarasumber.forEach((element) {
                      //   print(element.toJson());
                      // });
                      final userId = (ref.read(userProvider) as User).id!;
                      ref
                          .read(webinarProvider)
                          .createWebinar(
                            namaController.text,
                            deskripsiController.text,
                            int.parse(kuotaController.text),
                            tanggalController.text,
                            jamMulaiController.text,
                            userId,
                            linkController.text,
                            jamSelesaiController.text,
                            listNarasumber,
                          )
                          .then((value) {
                        MotionToast.success(
                          title: "Sukses",
                          description: value,
                          toastDuration: Duration(seconds: 3),
                        ).show(context);
                      }).catchError((error) {
                        MotionToast.error(
                          title: "Error",
                          description: "Gagal membuat webinar",
                          toastDuration: Duration(seconds: 2),
                        ).show(context);
                      });
                    },
                    child: Text("Buat Webinar"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
