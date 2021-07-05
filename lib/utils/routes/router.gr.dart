// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../page/home_page.dart' as _i6;
import '../../page/info_page.dart' as _i7;
import '../../page/login_page.dart' as _i3;
import '../../page/profile_page.dart' as _i8;
import '../../page/register_page.dart' as _i4;
import '../../page/webinar_create_page.dart' as _i5;
import '../../page/webinar_detail_page.dart' as _i10;
import '../../page/webinar_page.dart' as _i9;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ChooseRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.ChoosePage();
        }),
    UserLoginRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.UserLoginPage();
        }),
    CreatorLoginRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.CreatorLoginPage();
        }),
    UserRegisterRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.UserRegisterPage();
        }),
    CreatorRegisterRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.CreatorRegisterPage();
        }),
    WebinarCreateRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.WebinarCreate();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.HomePage();
        }),
    InfoRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.InfoPage();
        }),
    WebinarRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    ProfileRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.ProfilePage();
        }),
    WebinarRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.WebinarPage();
        }),
    WebinarDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<WebinarDetailRouteArgs>(
              orElse: () => WebinarDetailRouteArgs(
                  webinarId: pathParams.getInt('webinarId')));
          return _i10.WebinarDetailPage(webinarId: args.webinarId);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(ChooseRouter.name, path: '/'),
        _i1.RouteConfig(UserLoginRouter.name, path: 'login-user'),
        _i1.RouteConfig(CreatorLoginRouter.name, path: 'login-creator'),
        _i1.RouteConfig(UserRegisterRouter.name, path: 'register-user'),
        _i1.RouteConfig(CreatorRegisterRouter.name, path: 'register-creator'),
        _i1.RouteConfig(WebinarCreateRouter.name, path: 'create'),
        _i1.RouteConfig(HomeRoute.name, path: 'home', children: [
          _i1.RouteConfig(InfoRouter.name, path: 'info'),
          _i1.RouteConfig(WebinarRouter.name, path: 'webinar', children: [
            _i1.RouteConfig(WebinarRoute.name, path: ''),
            _i1.RouteConfig(WebinarDetailRoute.name, path: ':webinarId'),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '/', fullMatch: true)
          ]),
          _i1.RouteConfig(ProfileRouter.name, path: 'profile'),
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '/', fullMatch: true)
        ])
      ];
}

class ChooseRouter extends _i1.PageRouteInfo {
  const ChooseRouter() : super(name, path: '/');

  static const String name = 'ChooseRouter';
}

class UserLoginRouter extends _i1.PageRouteInfo {
  const UserLoginRouter() : super(name, path: 'login-user');

  static const String name = 'UserLoginRouter';
}

class CreatorLoginRouter extends _i1.PageRouteInfo {
  const CreatorLoginRouter() : super(name, path: 'login-creator');

  static const String name = 'CreatorLoginRouter';
}

class UserRegisterRouter extends _i1.PageRouteInfo {
  const UserRegisterRouter() : super(name, path: 'register-user');

  static const String name = 'UserRegisterRouter';
}

class CreatorRegisterRouter extends _i1.PageRouteInfo {
  const CreatorRegisterRouter() : super(name, path: 'register-creator');

  static const String name = 'CreatorRegisterRouter';
}

class WebinarCreateRouter extends _i1.PageRouteInfo {
  const WebinarCreateRouter() : super(name, path: 'create');

  static const String name = 'WebinarCreateRouter';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

class InfoRouter extends _i1.PageRouteInfo {
  const InfoRouter() : super(name, path: 'info');

  static const String name = 'InfoRouter';
}

class WebinarRouter extends _i1.PageRouteInfo {
  const WebinarRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'webinar', initialChildren: children);

  static const String name = 'WebinarRouter';
}

class ProfileRouter extends _i1.PageRouteInfo {
  const ProfileRouter() : super(name, path: 'profile');

  static const String name = 'ProfileRouter';
}

class WebinarRoute extends _i1.PageRouteInfo {
  const WebinarRoute() : super(name, path: '');

  static const String name = 'WebinarRoute';
}

class WebinarDetailRoute extends _i1.PageRouteInfo<WebinarDetailRouteArgs> {
  WebinarDetailRoute({required int webinarId})
      : super(name,
            path: ':webinarId',
            args: WebinarDetailRouteArgs(webinarId: webinarId),
            rawPathParams: {'webinarId': webinarId});

  static const String name = 'WebinarDetailRoute';
}

class WebinarDetailRouteArgs {
  const WebinarDetailRouteArgs({required this.webinarId});

  final int webinarId;
}
