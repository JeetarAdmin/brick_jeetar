import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future to({required String routeName}) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future toWithParameters({required String routeName, required Object args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future pushReplace({required String routeName, Object? args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  void newPage(Widget page) {
    Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          body: page,
        ),
      ),
    );
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }

  void backWithParameters({required Object args}) {
    return navigatorKey.currentState!.pop(args);
  }

  Future clearAllTo({required String routeName}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future clearAllToWithParameters(
      {required String routeName, required Object args}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }
}
