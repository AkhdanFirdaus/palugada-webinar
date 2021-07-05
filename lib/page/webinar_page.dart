import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/routes/router.gr.dart';

class WebinarPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _scrollController = useScrollController();

    useEffect(() {
      // _scrollController.dispose();
      return null;
    }, []);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: ListView(
          controller: _scrollController,
          children: [
            Container(
              margin: EdgeInsets.only(top: 38),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Cari Webinar",
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            SizedBox(height: 38),
            for (int index = 0; index < 10; index++)
              Card(
                child: InkWell(
                  onTap: () {
                    context.router.push(
                      WebinarDetailRoute(webinarId: index),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title $index",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              width: 160,
                              child: Text(
                                "Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            ButtonBar(
                              children: [
                                Chip(
                                  label: Text("20 Juli"),
                                ),
                                Chip(
                                  label: Text("Kuota 20"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
