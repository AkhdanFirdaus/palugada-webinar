// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../page/home_page.dart' as _i4;
import '../../page/info_page.dart' as _i11;
import '../../page/login_page.dart' as _i3;
import '../../page/penyelenggara_detail.dart' as _i10;
import '../../page/penyelenggara_page.dart' as _i9;
import '../../page/profile_page.dart' as _i12;
import '../../page/register_page.dart' as _i8;
import '../../page/webinar_create_page.dart' as _i5;
import '../../page/webinar_detail_page.dart' as _i7;
import '../../page/webinar_page.dart' as _i6;
import '../constants/enums.dart' as _i13;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    UnauthenticatedWrapperRouter.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return const _i1.EmptyRouterPage();
            }),
    HomeWrapperRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
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
    HomeRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.HomePage();
        }),
    WebinarCreateRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.WebinarCreate();
        }),
    MyWebinarRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MyWebinarRouterArgs>(
              orElse: () => const MyWebinarRouterArgs());
          return _i6.WebinarPage(type: args.type, userId: args.userId);
        }),
    JoinedWebinarRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<JoinedWebinarRouterArgs>(
              orElse: () => const JoinedWebinarRouterArgs());
          return _i6.WebinarPage(type: args.type, userId: args.userId);
        }),
    WebinarDetailRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<WebinarDetailRouterArgs>(
              orElse: () => WebinarDetailRouterArgs(
                  webinarId: pathParams.getInt('webinarId')));
          return _i7.WebinarDetailPage(webinarId: args.webinarId);
        }),
    RegisterRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RegisterRouterArgs>();
          return _i8.RegisterPage(args.role);
        }),
    PenyelenggaraRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.PenyelenggaraPage();
        }),
    PenyelenggaraDetailRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<PenyelenggaraDetailRouterArgs>(
              orElse: () => PenyelenggaraDetailRouterArgs(
                  penyelenggaraId: pathParams.getInt('penyelenggaraId')));
          return _i10.PenyelenggaraDetailPage(
              penyelenggaraId: args.penyelenggaraId);
        }),
    InfoRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.InfoPage();
        }),
    WebinarRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WebinarRouterArgs>(
              orElse: () => const WebinarRouterArgs());
          return _i6.WebinarPage(type: args.type, userId: args.userId);
        }),
    ProfileRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.ProfilePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(UnauthenticatedWrapperRouter.name,
            path: '/',
            children: [
              _i1.RouteConfig(ChooseRouter.name, path: ''),
              _i1.RouteConfig(UserLoginRouter.name, path: 'login-user'),
              _i1.RouteConfig(CreatorLoginRouter.name, path: 'login-creator')
            ]),
        _i1.RouteConfig(HomeWrapperRouter.name, path: 'home', children: [
          _i1.RouteConfig(HomeRouter.name, path: '', children: [
            _i1.RouteConfig(InfoRouter.name, path: 'info'),
            _i1.RouteConfig(WebinarRouter.name, path: 'webinar'),
            _i1.RouteConfig(ProfileRouter.name, path: 'profile'),
            _i1.RouteConfig('*#redirect',
                path: '*', redirectTo: '/', fullMatch: true)
          ]),
          _i1.RouteConfig(WebinarCreateRouter.name, path: 'webinar-create'),
          _i1.RouteConfig(MyWebinarRouter.name, path: 'webinar-my'),
          _i1.RouteConfig(JoinedWebinarRouter.name, path: 'webinar-joined'),
          _i1.RouteConfig(WebinarDetailRouter.name, path: 'webinar-detail/:id'),
          _i1.RouteConfig(RegisterRouter.name, path: 'register'),
          _i1.RouteConfig(PenyelenggaraRouter.name, path: 'penyelenggara'),
          _i1.RouteConfig(PenyelenggaraDetailRouter.name,
              path: 'penyelenggara/:id')
        ])
      ];
}

class UnauthenticatedWrapperRouter extends _i1.PageRouteInfo {
  const UnauthenticatedWrapperRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'UnauthenticatedWrapperRouter';
}

class HomeWrapperRouter extends _i1.PageRouteInfo {
  const HomeWrapperRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeWrapperRouter';
}

class ChooseRouter extends _i1.PageRouteInfo {
  const ChooseRouter() : super(name, path: '');

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

class HomeRouter extends _i1.PageRouteInfo {
  const HomeRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: '', initialChildren: children);

  static const String name = 'HomeRouter';
}

class WebinarCreateRouter extends _i1.PageRouteInfo {
  const WebinarCreateRouter() : super(name, path: 'webinar-create');

  static const String name = 'WebinarCreateRouter';
}

class MyWebinarRouter extends _i1.PageRouteInfo<MyWebinarRouterArgs> {
  MyWebinarRouter({_i13.webinarType? type, int? userId})
      : super(name,
            path: 'webinar-my',
            args: MyWebinarRouterArgs(type: type, userId: userId));

  static const String name = 'MyWebinarRouter';
}

class MyWebinarRouterArgs {
  const MyWebinarRouterArgs({this.type, this.userId});

  final _i13.webinarType? type;

  final int? userId;
}

class JoinedWebinarRouter extends _i1.PageRouteInfo<JoinedWebinarRouterArgs> {
  JoinedWebinarRouter({_i13.webinarType? type, int? userId})
      : super(name,
            path: 'webinar-joined',
            args: JoinedWebinarRouterArgs(type: type, userId: userId));

  static const String name = 'JoinedWebinarRouter';
}

class JoinedWebinarRouterArgs {
  const JoinedWebinarRouterArgs({this.type, this.userId});

  final _i13.webinarType? type;

  final int? userId;
}

class WebinarDetailRouter extends _i1.PageRouteInfo<WebinarDetailRouterArgs> {
  WebinarDetailRouter({required int webinarId})
      : super(name,
            path: 'webinar-detail/:id',
            args: WebinarDetailRouterArgs(webinarId: webinarId),
            rawPathParams: {'webinarId': webinarId});

  static const String name = 'WebinarDetailRouter';
}

class WebinarDetailRouterArgs {
  const WebinarDetailRouterArgs({required this.webinarId});

  final int webinarId;
}

class RegisterRouter extends _i1.PageRouteInfo<RegisterRouterArgs> {
  RegisterRouter({required int role})
      : super(name, path: 'register', args: RegisterRouterArgs(role: role));

  static const String name = 'RegisterRouter';
}

class RegisterRouterArgs {
  const RegisterRouterArgs({required this.role});

  final int role;
}

class PenyelenggaraRouter extends _i1.PageRouteInfo {
  const PenyelenggaraRouter() : super(name, path: 'penyelenggara');

  static const String name = 'PenyelenggaraRouter';
}

class PenyelenggaraDetailRouter
    extends _i1.PageRouteInfo<PenyelenggaraDetailRouterArgs> {
  PenyelenggaraDetailRouter({required int penyelenggaraId})
      : super(name,
            path: 'penyelenggara/:id',
            args:
                PenyelenggaraDetailRouterArgs(penyelenggaraId: penyelenggaraId),
            rawPathParams: {'penyelenggaraId': penyelenggaraId});

  static const String name = 'PenyelenggaraDetailRouter';
}

class PenyelenggaraDetailRouterArgs {
  const PenyelenggaraDetailRouterArgs({required this.penyelenggaraId});

  final int penyelenggaraId;
}

class InfoRouter extends _i1.PageRouteInfo {
  const InfoRouter() : super(name, path: 'info');

  static const String name = 'InfoRouter';
}

class WebinarRouter extends _i1.PageRouteInfo<WebinarRouterArgs> {
  WebinarRouter({_i13.webinarType? type, int? userId})
      : super(name,
            path: 'webinar',
            args: WebinarRouterArgs(type: type, userId: userId));

  static const String name = 'WebinarRouter';
}

class WebinarRouterArgs {
  const WebinarRouterArgs({this.type, this.userId});

  final _i13.webinarType? type;

  final int? userId;
}

class ProfileRouter extends _i1.PageRouteInfo {
  const ProfileRouter() : super(name, path: 'profile');

  static const String name = 'ProfileRouter';
}
