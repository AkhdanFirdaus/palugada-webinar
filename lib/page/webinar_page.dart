import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/webinar_controller.dart';
import 'package:palugada/models/webinar.dart';
import '../utils/routes/router.gr.dart';

class WebinarPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scrollController = useScrollController();
    final searchController = useTextEditingController();
    final webinarList = ref.watch(webinarFutureProvider);
    final search = useState<String>("");
    useEffect(() {
      searchController.addListener(() {
        search.value = searchController.text;
      });
      return null;
    }, []);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: RefreshIndicator(
          onRefresh: () {
            ref.refresh(webinarFutureProvider);
            return Future.value();
          },
          child: ListView(
            controller: _scrollController,
            children: [
              Container(
                margin: EdgeInsets.only(top: 38),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Cari Webinar",
                    fillColor: Colors.grey.shade200,
                    suffixIcon: search.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(Icons.close),
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 38),
              webinarList.when(
                data: (data) {
                  return ValueListenableBuilder<String>(
                      valueListenable: search,
                      builder: (context, keyword, child) {
                        final filteredData = data
                            .where((e) => e.nama
                                .toLowerCase()
                                .contains(keyword.toLowerCase()))
                            .toList();
                        if (filteredData.isNotEmpty) {
                          return Column(
                            children: [
                              for (WebinarState webinar in filteredData)
                                _CardItem(webinar),
                            ],
                          );
                        } else {
                          return Center(child: Text("Tidak ada webinar"));
                        }
                      });
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
                error: (e, s) {
                  return Center(child: Text(e.toString()));
                },
              ),
              // if (webinarList != null)
              //   for (final webinar in webinarList) _CardItem(webinar)
              // else
              //   Center(child: Text("Tidak ada webinar"))
            ],
          ),
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  _CardItem(this.webinar);

  final WebinarState webinar;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.router.push(
            WebinarDetailRoute(webinarId: webinar.id),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Placeholder(),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        webinar.nama,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "oleh " + webinar.penyelenggara.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    ButtonBar(
                      children: [
                        Chip(
                          label: Text(webinar.tanggal),
                        ),
                        Chip(
                          label: Text("Kuota ${webinar.kuota}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
