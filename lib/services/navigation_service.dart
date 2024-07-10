import 'package:flutter/material.dart';

class NavigationService<T, U> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?>? pushNamed(String routeName, {Object? args}) async =>
      navigatorKey.currentState?.pushNamed<T>(
        routeName,
        arguments: args,
      );

  Future<T?> push(Widget page, {Object? args}) async =>
      navigatorKey.currentState?.push<T>(
        MaterialPageRoute(builder: (context) => page, settings: RouteSettings(arguments: args)),
      );

  Future pushReplacement(Widget page) async =>
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => page),
      );

  Future<T?>? pushReplacementNamed(String routeName, {Object? args}) async =>
      navigatorKey.currentState?.pushReplacementNamed<T, U>(
        routeName,
        arguments: args,
      );

  Future<T?>? pushNamedAndRemoveUntil(
    String routeName, {
    Object? args,
    bool Function(Route<dynamic>)? predicate,
  }) async =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
        routeName,
        predicate ?? (_) => false,
        arguments: args,
      );

  Future<T?>? pushAndRemoveUntil(
    Widget page, {
    bool Function(Route<dynamic>)? predicate,
  }) async =>
      navigatorKey.currentState?.pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (context) => page),
        predicate ?? (_) => false,
      );

  Future<bool?>? maybePop([Object? args]) async =>
      navigatorKey.currentState?.maybePop(args);

  bool? canPop() => navigatorKey.currentState?.canPop();

  void pop([T? result]) => navigatorKey.currentState?.pop<T>(result);
}
