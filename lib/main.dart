import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/auth/index.dart';
import 'core/constants/persistence_constants.dart';
import 'core/routes/router.dart';
import 'core/themes/palugada_theme.dart';

void main() async {
  setPathUrlStrategy();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserGuestStateAdapter());
  await Hive.openBox<UserState>(PersistenceConstants.userBox);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final _appRouter = AppRouter();
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [
          if (user != null)
            HomeWrapperRouter(children: [
              HomeRouter(children: [InfoRouter()])
            ])
          else
            UnauthenticatedWrapperRouter(),
        ],
      ),
      title: 'Palugada Webinar',
      theme: PalugadaTheme.defaultTheme,
    );
  }
}
