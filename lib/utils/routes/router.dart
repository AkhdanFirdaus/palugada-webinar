import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:palugada/page/penyelenggara_detail.dart';
import 'package:palugada/page/penyelenggara_page.dart';
import '../../page/home_page.dart';
import '../../page/info_page.dart';
import '../../page/login_page.dart';
import '../../page/profile_page.dart';
import '../../page/register_page.dart';
import '../../page/webinar_create_page.dart';
import '../../page/webinar_detail_page.dart';
import '../../page/webinar_page.dart';

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
              page: InfoPage,
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
class $AppRouter {}
