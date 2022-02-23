// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import '../../../view/authentication/instagram/instagram_view.dart'
    as _i2;
import '../../../view/authentication/login/login_view.dart'
    as _i1;
import '../../../view/profile/profile_view.dart'
    as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LoginView());
    },
    InstagramRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.InstagramView());
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i3.ProfileView(key: args.key, mediaUrlList: args.mediaUrlList));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginRoute.name, path: '/'),
        _i4.RouteConfig(InstagramRoute.name, path: '/instagram-view'),
        _i4.RouteConfig(ProfileRoute.name, path: '/profile-view')
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.InstagramView]
class InstagramRoute extends _i4.PageRouteInfo<void> {
  const InstagramRoute() : super(InstagramRoute.name, path: '/instagram-view');

  static const String name = 'InstagramRoute';
}

/// generated route for
/// [_i3.ProfileView]
class ProfileRoute extends _i4.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({_i5.Key? key, List<String>? mediaUrlList})
      : super(ProfileRoute.name,
            path: '/profile-view',
            args: ProfileRouteArgs(key: key, mediaUrlList: mediaUrlList));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key, this.mediaUrlList});

  final _i5.Key? key;

  final List<String>? mediaUrlList;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, mediaUrlList: $mediaUrlList}';
  }
}
