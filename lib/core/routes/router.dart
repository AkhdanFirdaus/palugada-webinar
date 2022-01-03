import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/home_page.dart';
import '../../features/auth/index.dart';
import '../../features/event-organizer/index.dart';
import '../../features/event/index.dart';
import '../constants/enums.dart';

export 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'UnauthenticatedWrapperRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          name: 'ChooseRouter',
          page: ChoosePage,
        ),
        AutoRoute(
          path: 'login-user',
          name: 'UserLoginRouter',
          page: UserLoginPage,
        ),
        AutoRoute(
          path: 'login-creator',
          name: 'CreatorLoginRouter',
          page: CreatorLoginPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'home',
      name: 'HomeWrapperRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          name: 'HomeRouter',
          page: HomePage,
          children: [
            AutoRoute(
              path: 'info',
              name: 'InfoRouter',
              page: WebinarSearchPage,
            ),
            AutoRoute(
              path: 'webinar',
              name: 'WebinarRouter',
              page: WebinarPage,
            ),
            AutoRoute(
              path: 'profile',
              name: 'ProfileRouter',
              page: ProfilePage,
            ),
            RedirectRoute(path: '*', redirectTo: '/'),
          ],
        ),
        AutoRoute(
          path: 'webinar-create',
          name: 'WebinarCreateRouter',
          page: WebinarCreate,
        ),
        AutoRoute(
          path: 'webinar-my',
          name: 'MyWebinarRouter',
          page: WebinarPage,
        ),
        AutoRoute(
          path: 'webinar-joined',
          name: 'JoinedWebinarRouter',
          page: WebinarPage,
        ),
        AutoRoute(
          path: 'webinar-detail/:id',
          name: 'WebinarDetailRouter',
          page: WebinarDetailPage,
        ),
        AutoRoute(
          path: 'register',
          name: 'RegisterRouter',
          page: RegisterPage,
        ),
        AutoRoute(
          path: 'penyelenggara',
          name: 'PenyelenggaraRouter',
          page: PenyelenggaraPage,
        ),
        AutoRoute(
          path: 'penyelenggara/:id',
          name: 'PenyelenggaraDetailRouter',
          page: PenyelenggaraDetailPage,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
