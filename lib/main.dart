import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'models/user.dart';
import 'utils/routes/router.gr.dart';
import 'utils/themes/palugada_theme.dart';

void main() async {
  setPathUrlStrategy();
  await initLocalStorage();
  runApp(MyApp());
}

Future<void> initLocalStorage() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserGuestStateAdapter());
  Hive.registerAdapter(UserLoggedInStateAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return ProviderScope(
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: 'Flutter Demo',
        theme: PalugadaTheme.defaultTheme,
      ),
    );
  }
}
