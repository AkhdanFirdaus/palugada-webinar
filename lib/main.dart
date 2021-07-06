import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palugada/controllers/user_controller.dart';
import 'package:palugada/models/user.dart';
import 'package:palugada/utils/constants/persistence_constants.dart';
import 'package:url_strategy/url_strategy.dart';

import 'utils/routes/router.gr.dart';
import 'utils/themes/palugada_theme.dart';

void main() async {
  setPathUrlStrategy();
  await Hive.initFlutter();
  Hive.registerAdapter(UserLoggedInStateAdapter());
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
      title: 'Flutter Demo',
      theme: PalugadaTheme.defaultTheme,
    );
  }
}
