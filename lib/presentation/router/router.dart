// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppRouter {
  static const HOME_SCREEN = "/dashboard";
  static const LANDING_SCREEN = "/landing";
  static const SETTINGS_SCREEN = "/settings";
  static const ANIME_INFO_SCREEN = "/anime_info";
  static const WATCHLIST_SCREEN = "/watch_list";
  static const SEARCH_SCREEN = "/search";
  static const WATCH_HISTORY_SCREEN = "/watch_history";
  static const GENRE_SCREEN = "/byGenre";
  static const RECENT_EPISODES_SCREEN = "/recentEpisodes";
  static const ANIME_PLAYER_SCREEN = "/anime/watch";

  static Route? ongeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case LANDING_SCREEN:
        return _animatePage(const Scaffold());

      default:
        return null;
    }
  }
}

class AppNavigator {
  static pop(BuildContext context, {bool? value}) async {
    Navigator.pop(context, value);
  }

  static push({
    required BuildContext context,
    required String screenName,
    Map<String, dynamic>? arguments,
  }) async {
    Navigator.pushNamed(context, screenName, arguments: arguments);
  }

  static pushReplacement({
    required BuildContext context,
    required String screenName,
    Map<String, dynamic>? arguments,
  }) async {
    Navigator.pushReplacementNamed(context, screenName, arguments: arguments);
  }

  static pushAndRemoveUntil({
    required BuildContext context,
    required String screenName,
    Map<String, dynamic>? arguments,
  }) async {
    Navigator.pushNamedAndRemoveUntil(context, screenName, (predicate) {
      return false;
    });
  }

  static popAndPush(
      {required BuildContext context, required String screenName}) async {
    Navigator.popAndPushNamed(context, screenName);
  }

  static clearRouteIfFirst(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

Route _animatePage(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.linear;

      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}
