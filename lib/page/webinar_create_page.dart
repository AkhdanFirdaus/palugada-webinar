import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:palugada/models/user.dart';

class WebinarCreate extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaController = useTextEditingController();
    final kuotaController = useTextEditingController();
    final linkController = useTextEditingController();
    final tanggalController = useTextEditingController();
    final jamMulaiController = useTextEditingController();
    final jamSelesaiController = useTextEditingController();
    final listNarasumber = useState<List<User>>([]);
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
              controller: namaController,
            ),
            SizedBox(height: 18),
            Text("Tanggal Webinar"),
            SizedBox(height: 8),
            TextFormField(
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
              controller: kuotaController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18),
            Text("Link Webinar"),
            SizedBox(height: 8),
            TextFormField(
              controller: linkController,
            ),
            SizedBox(height: 18),
            Text("Narasumber"),
            SizedBox(height: 8),
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
                      decoration: InputDecoration(labelText: "Nama"),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      decoration: InputDecoration(labelText: "Nomor Telp"),
                    ),
                    SizedBox(height: 18),
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
