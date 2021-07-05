import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class WebinarDetailPage extends StatelessWidget {
  WebinarDetailPage({@PathParam('webinarId') required this.webinarId});
  final int webinarId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
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
                  "Event $webinarId",
                  style: Theme.of(context).textTheme.headline5,
                ),
                centerTitle: true,
              ),
            ),
            SizedBox(height: 38),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Card(
                    child: InkWell(
                      child: SizedBox(
                        height: 320,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Center(
                            child: Text("Gambar"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "27/03",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "2021",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text(
                                "Kuota Peserta",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(height: 8),
                              Chip(
                                label: Text("20"),
                                backgroundColor: Colors.blue,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Kuota Tersisa",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(height: 8),
                              Chip(
                                label: Text("3"),
                                backgroundColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 38),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi Event"),
                  SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 38),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Penyelenggara"),
                  SizedBox(height: 8),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.apartment),
                      title: Text("Nama Penyelenggara"),
                      trailing: Chip(label: Text("3")),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 38),
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
