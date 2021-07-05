import 'package:flutter/material.dart';

class WebinarCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            TextFormField(),
            SizedBox(height: 18),
            Text("Penyelenggara"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            Text("No. Telepon"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            Text("Email"),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 18),
            Text("Tanggal Webinar"),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 18),
            Text("Kuota"),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18),
            Text("Link Webinar"),
            SizedBox(height: 8),
            TextFormField(),
            SizedBox(height: 18),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Masuk"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
