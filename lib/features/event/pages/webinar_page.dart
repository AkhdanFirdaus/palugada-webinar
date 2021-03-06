import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../index.dart';
import '../../../core/constants/enums.dart';
import '../../../core/routes/router.dart';

class WebinarPage extends HookConsumerWidget {
  WebinarPage({this.type = WebinarType.all, this.userId});
  final WebinarType? type;
  final int? userId;

  String title() {
    switch (type!) {
      case WebinarType.joined:
        return "Joined Webinar";
      case WebinarType.my:
        return "My Webinar";
      case WebinarType.all:
        return "Webinar";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scrollController = useScrollController();
    final searchController = useTextEditingController();

    AsyncValue<List<Event>> webinarList() {
      if (type != null) {
        switch (type!) {
          case WebinarType.all:
            return ref.watch(webinarFutureProvider);
          case WebinarType.joined:
            return ref.watch(joinedWebinarFutureProvider(userId!));
          case WebinarType.my:
            return ref.watch(myWebinarFutureProvider(userId!));
        }
      }
      return ref.watch(webinarFutureProvider);
    }

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
            if (type != null) {
              switch (type!) {
                case WebinarType.all:
                  ref.refresh(webinarFutureProvider);
                  break;
                case WebinarType.joined:
                  ref.refresh(joinedWebinarFutureProvider(userId!));
                  break;
                case WebinarType.my:
                  ref.refresh(myWebinarFutureProvider(userId!));
                  break;
                default:
                  ref.refresh(webinarFutureProvider);
                  break;
              }
            }
            return Future.value();
          },
          child: ListView(
            controller: _scrollController,
            children: [
              if (userId != null)
                Container(
                  margin: const EdgeInsets.only(top: 38),
                  child: AppBar(
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
                      title(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    centerTitle: true,
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 38),
                child: Row(
                  children: [
                    Expanded(
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
                    Card(
                      child: IconButton(
                        onPressed: () {
                          ref.refresh(webinarFutureProvider);
                        },
                        icon: Icon(Icons.refresh),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 38),
              webinarList().when(
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
                              for (Event webinar in filteredData)
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
            ],
          ),
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  _CardItem(this.webinar);
  final Event webinar;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          context.router.push(WebinarDetailRouter(webinarId: webinar.id));
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
