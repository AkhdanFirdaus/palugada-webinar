// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    UnauthenticatedWrapperRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    HomeWrapperRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ChooseRouter.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: ChoosePage());
    },
    UserLoginRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: UserLoginPage());
    },
    CreatorLoginRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CreatorLoginPage());
    },
    HomeRouter.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: HomePage());
    },
    WebinarCreateRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WebinarCreate());
    },
    MyWebinarRouter.name: (routeData) {
      final args = routeData.argsAs<MyWebinarRouterArgs>(
          orElse: () => const MyWebinarRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WebinarPage(type: args.type, userId: args.userId));
    },
    JoinedWebinarRouter.name: (routeData) {
      final args = routeData.argsAs<JoinedWebinarRouterArgs>(
          orElse: () => const JoinedWebinarRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WebinarPage(type: args.type, userId: args.userId));
    },
    WebinarDetailRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<WebinarDetailRouterArgs>(
          orElse: () => WebinarDetailRouterArgs(
              webinarId: pathParams.getInt('webinarId')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WebinarDetailPage(webinarId: args.webinarId));
    },
    RegisterRouter.name: (routeData) {
      final args = routeData.argsAs<RegisterRouterArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData, child: RegisterPage(args.role));
    },
    PenyelenggaraRouter.name: (routeData) {
      final args = routeData.argsAs<PenyelenggaraRouterArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PenyelenggaraPage(
              isFavorite: args.isFavorite, userId: args.userId));
    },
    PenyelenggaraDetailRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PenyelenggaraDetailRouterArgs>(
          orElse: () => PenyelenggaraDetailRouterArgs(
              penyelenggaraId: pathParams.getInt('penyelenggaraId')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              PenyelenggaraDetailPage(penyelenggaraId: args.penyelenggaraId));
    },
    InfoRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WebinarSearchPage());
    },
    WebinarRouter.name: (routeData) {
      final args = routeData.argsAs<WebinarRouterArgs>(
          orElse: () => const WebinarRouterArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WebinarPage(type: args.type, userId: args.userId));
    },
    ProfileRouter.name: (routeData) {
      return MaterialPageX<dynamic>(routeData: routeData, child: ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: 'splash'),
        RouteConfig(UnauthenticatedWrapperRouter.name, path: '/', children: [
          RouteConfig(ChooseRouter.name,
              path: '', parent: UnauthenticatedWrapperRouter.name),
          RouteConfig(UserLoginRouter.name,
              path: 'login-user', parent: UnauthenticatedWrapperRouter.name),
          RouteConfig(CreatorLoginRouter.name,
              path: 'login-creator', parent: UnauthenticatedWrapperRouter.name)
        ]),
        RouteConfig(HomeWrapperRouter.name, path: 'home', children: [
          RouteConfig(HomeRouter.name,
              path: '',
              parent: HomeWrapperRouter.name,
              children: [
                RouteConfig(InfoRouter.name,
                    path: 'info', parent: HomeRouter.name),
                RouteConfig(WebinarRouter.name,
                    path: 'webinar', parent: HomeRouter.name),
                RouteConfig(ProfileRouter.name,
                    path: 'profile', parent: HomeRouter.name),
                RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeRouter.name,
                    redirectTo: '/',
                    fullMatch: true)
              ]),
          RouteConfig(WebinarCreateRouter.name,
              path: 'webinar-create', parent: HomeWrapperRouter.name),
          RouteConfig(MyWebinarRouter.name,
              path: 'webinar-my', parent: HomeWrapperRouter.name),
          RouteConfig(JoinedWebinarRouter.name,
              path: 'webinar-joined', parent: HomeWrapperRouter.name),
          RouteConfig(WebinarDetailRouter.name,
              path: 'webinar-detail/:id', parent: HomeWrapperRouter.name),
          RouteConfig(RegisterRouter.name,
              path: 'register', parent: HomeWrapperRouter.name),
          RouteConfig(PenyelenggaraRouter.name,
              path: 'penyelenggara', parent: HomeWrapperRouter.name),
          RouteConfig(PenyelenggaraDetailRouter.name,
              path: 'penyelenggara/:id', parent: HomeWrapperRouter.name)
        ])
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [EmptyRouterPage]
class UnauthenticatedWrapperRouter extends PageRouteInfo<void> {
  const UnauthenticatedWrapperRouter({List<PageRouteInfo>? children})
      : super(UnauthenticatedWrapperRouter.name,
            path: '/', initialChildren: children);

  static const String name = 'UnauthenticatedWrapperRouter';
}

/// generated route for
/// [EmptyRouterPage]
class HomeWrapperRouter extends PageRouteInfo<void> {
  const HomeWrapperRouter({List<PageRouteInfo>? children})
      : super(HomeWrapperRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeWrapperRouter';
}

/// generated route for
/// [ChoosePage]
class ChooseRouter extends PageRouteInfo<void> {
  const ChooseRouter() : super(ChooseRouter.name, path: '');

  static const String name = 'ChooseRouter';
}

/// generated route for
/// [UserLoginPage]
class UserLoginRouter extends PageRouteInfo<void> {
  const UserLoginRouter() : super(UserLoginRouter.name, path: 'login-user');

  static const String name = 'UserLoginRouter';
}

/// generated route for
/// [CreatorLoginPage]
class CreatorLoginRouter extends PageRouteInfo<void> {
  const CreatorLoginRouter()
      : super(CreatorLoginRouter.name, path: 'login-creator');

  static const String name = 'CreatorLoginRouter';
}

/// generated route for
/// [HomePage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(HomeRouter.name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [WebinarCreate]
class WebinarCreateRouter extends PageRouteInfo<void> {
  const WebinarCreateRouter()
      : super(WebinarCreateRouter.name, path: 'webinar-create');

  static const String name = 'WebinarCreateRouter';
}

/// generated route for
/// [WebinarPage]
class MyWebinarRouter extends PageRouteInfo<MyWebinarRouterArgs> {
  MyWebinarRouter({WebinarType? type = WebinarType.all, int? userId})
      : super(MyWebinarRouter.name,
            path: 'webinar-my',
            args: MyWebinarRouterArgs(type: type, userId: userId));

  static const String name = 'MyWebinarRouter';
}

class MyWebinarRouterArgs {
  const MyWebinarRouterArgs({this.type = WebinarType.all, this.userId});

  final WebinarType? type;

  final int? userId;

  @override
  String toString() {
    return 'MyWebinarRouterArgs{type: $type, userId: $userId}';
  }
}

/// generated route for
/// [WebinarPage]
class JoinedWebinarRouter extends PageRouteInfo<JoinedWebinarRouterArgs> {
  JoinedWebinarRouter({WebinarType? type = WebinarType.all, int? userId})
      : super(JoinedWebinarRouter.name,
            path: 'webinar-joined',
            args: JoinedWebinarRouterArgs(type: type, userId: userId));

  static const String name = 'JoinedWebinarRouter';
}

class JoinedWebinarRouterArgs {
  const JoinedWebinarRouterArgs({this.type = WebinarType.all, this.userId});

  final WebinarType? type;

  final int? userId;

  @override
  String toString() {
    return 'JoinedWebinarRouterArgs{type: $type, userId: $userId}';
  }
}

/// generated route for
/// [WebinarDetailPage]
class WebinarDetailRouter extends PageRouteInfo<WebinarDetailRouterArgs> {
  WebinarDetailRouter({required int webinarId})
      : super(WebinarDetailRouter.name,
            path: 'webinar-detail/:id',
            args: WebinarDetailRouterArgs(webinarId: webinarId),
            rawPathParams: {'webinarId': webinarId});

  static const String name = 'WebinarDetailRouter';
}

class WebinarDetailRouterArgs {
  const WebinarDetailRouterArgs({required this.webinarId});

  final int webinarId;

  @override
  String toString() {
    return 'WebinarDetailRouterArgs{webinarId: $webinarId}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRouter extends PageRouteInfo<RegisterRouterArgs> {
  RegisterRouter({required int role})
      : super(RegisterRouter.name,
            path: 'register', args: RegisterRouterArgs(role: role));

  static const String name = 'RegisterRouter';
}

class RegisterRouterArgs {
  const RegisterRouterArgs({required this.role});

  final int role;

  @override
  String toString() {
    return 'RegisterRouterArgs{role: $role}';
  }
}

/// generated route for
/// [PenyelenggaraPage]
class PenyelenggaraRouter extends PageRouteInfo<PenyelenggaraRouterArgs> {
  PenyelenggaraRouter({required bool isFavorite, int? userId})
      : super(PenyelenggaraRouter.name,
            path: 'penyelenggara',
            args: PenyelenggaraRouterArgs(
                isFavorite: isFavorite, userId: userId));

  static const String name = 'PenyelenggaraRouter';
}

class PenyelenggaraRouterArgs {
  const PenyelenggaraRouterArgs({required this.isFavorite, this.userId});

  final bool isFavorite;

  final int? userId;

  @override
  String toString() {
    return 'PenyelenggaraRouterArgs{isFavorite: $isFavorite, userId: $userId}';
  }
}

/// generated route for
/// [PenyelenggaraDetailPage]
class PenyelenggaraDetailRouter
    extends PageRouteInfo<PenyelenggaraDetailRouterArgs> {
  PenyelenggaraDetailRouter({required int penyelenggaraId})
      : super(PenyelenggaraDetailRouter.name,
            path: 'penyelenggara/:id',
            args:
                PenyelenggaraDetailRouterArgs(penyelenggaraId: penyelenggaraId),
            rawPathParams: {'penyelenggaraId': penyelenggaraId});

  static const String name = 'PenyelenggaraDetailRouter';
}

class PenyelenggaraDetailRouterArgs {
  const PenyelenggaraDetailRouterArgs({required this.penyelenggaraId});

  final int penyelenggaraId;

  @override
  String toString() {
    return 'PenyelenggaraDetailRouterArgs{penyelenggaraId: $penyelenggaraId}';
  }
}

/// generated route for
/// [WebinarSearchPage]
class InfoRouter extends PageRouteInfo<void> {
  const InfoRouter() : super(InfoRouter.name, path: 'info');

  static const String name = 'InfoRouter';
}

/// generated route for
/// [WebinarPage]
class WebinarRouter extends PageRouteInfo<WebinarRouterArgs> {
  WebinarRouter({WebinarType? type = WebinarType.all, int? userId})
      : super(WebinarRouter.name,
            path: 'webinar',
            args: WebinarRouterArgs(type: type, userId: userId));

  static const String name = 'WebinarRouter';
}

class WebinarRouterArgs {
  const WebinarRouterArgs({this.type = WebinarType.all, this.userId});

  final WebinarType? type;

  final int? userId;

  @override
  String toString() {
    return 'WebinarRouterArgs{type: $type, userId: $userId}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRouter extends PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}
