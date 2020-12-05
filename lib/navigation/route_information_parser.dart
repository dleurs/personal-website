import 'package:flutter/material.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/ui/screens/detail_screen.dart';
import 'package:personal_website/ui/screens/home_screen.dart';
import 'package:personal_website/ui/screens/settings_language_screen.dart';
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
    if (state == SettingsLanguageScreen.getConfig()) {
      return RouteInformation(
          location: SettingsLanguageScreen.getConfig().uri.path);
    }
    return RouteInformation(location: '/unknown');
  }
}

AppConfig parseRoute(Uri uri) {
  // Handle '/'
  if (uri.pathSegments.length == 0) {
    return HomeScreen.getConfig();
  }
  // Handle '/todo'
  if (uri.pathSegments.length == 1) {
    if (uri.pathSegments[0] == DetailScreen.getConfig().uri.pathSegments[0]) {
      return DetailScreen.getConfig();
    }
  }

  // Handle '/todo/:id'
  if (uri.pathSegments.length == 2) {
    if (uri.pathSegments[0] ==
        SettingsLanguageScreen.getConfig().uri.pathSegments[0]) {
      if (uri.pathSegments[1] ==
          SettingsLanguageScreen.getConfig().uri.pathSegments[1]) {
        return SettingsLanguageScreen.getConfig();
      }
    }
  }
  // Handle unknown routes
  return UnknownScreen.getConfig();
}
