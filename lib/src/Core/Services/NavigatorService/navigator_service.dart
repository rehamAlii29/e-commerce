import 'package:flutter/material.dart';

class NavigatorService {
  NavigatorService._();

  static final NavigatorService _instance = NavigatorService._();

  factory NavigatorService() {
    return _instance;
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? to(String routName, {Object? argument}) {
    return navigatorKey.currentState?.pushNamed(routName, arguments: argument);
  }

  void back() {
    navigatorKey.currentState?.pop();
  }

  Future<dynamic>? off(String routName, {Object? argument}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routName, (route) => false,
        arguments: argument);
  }
}
