import 'package:flutter/material.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/ui/screens/detail_screen.dart';
import 'package:personal_website/ui/screens/home_screen.dart';
import 'package:personal_website/ui/screens/unknown_screen.dart';

class MyRouteInformationParser extends RouteInformationParser<AppConfig> {
  @override
  Future<AppConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    return parseRoute(uri);
  }

  @override
  RouteInformation restoreRouteInformation(AppConfig state) {
    if (state == UnknownScreen.getConfig()) {
      return RouteInformation(location: UnknownScreen.getConfig().uri.path);
    }
    if (state == HomeScreen.getConfig()) {
      return RouteInformation(location: HomeScreen.getConfig().uri.path);
    }
    if (state == DetailScreen.getConfig()) {
      return RouteInformation(location: DetailScreen.getConfig().uri.path);
    }
    return RouteInformation(location: '/unknown');
  }
}

AppConfig parseRoute(Uri uri) {
  // Handle '/'
  if (uri.pathSegments.length == 0) {
    return HomeScreen.getConfig();
  }
  // Handle '/details'
  if (uri.pathSegments.length == 1) {
    if (uri.pathSegments[0] == DetailScreen.getConfig().uri.pathSegments[0]) {
      return DetailScreen.getConfig();
    }
  }

  // Handle unknown routes
  return UnknownScreen.getConfig();
}
