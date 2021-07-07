import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/penyelenggara_controller.dart';
import '../controllers/webinar_controller.dart';
import '../models/user.dart';
import '../utils/routes/router.gr.dart';

class PenyelenggaraPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scrollController = useScrollController();
    final searchController = useTextEditingController();

    final penyelenggaraList = ref.watch(penyelenggaraFutureProvider);

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
                    "Penyelenggara",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  centerTitle: true,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 38),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Cari Penyelenggara",
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
              penyelenggaraList.when(
                data: (data) {
                  return ValueListenableBuilder<String>(
                      valueListenable: search,
                      builder: (context, keyword, child) {
                        final filteredData = data
                            .where((e) => e.name
                                .toLowerCase()
                                .contains(keyword.toLowerCase()))
                            .toList();
                        if (filteredData.isNotEmpty) {
                          return Column(
                            children: [
                              for (User penyelenggara in filteredData)
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      context.router.push(
                                        PenyelenggaraDetailRouter(
                                            penyelenggaraId: penyelenggara.id),
                                      );
                                    },
                                    title: Text(penyelenggara.name),
                                    subtitle: Text(penyelenggara.email),
                                    trailing: Chip(
                                      label: Text(
                                        penyelenggara.countWebinar.toString(),
                                      ),
                                    ),
                                  ),
                                ),
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
