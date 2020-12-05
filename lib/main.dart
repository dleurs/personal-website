import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/ui/screens/detail_screen.dart';
import 'package:personal_website/ui/screens/home_screen.dart';
import 'package:personal_website/ui/screens/settings_language_screen.dart';
import 'package:personal_website/ui/screens/unknown_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyRouterDelegate _routerDelegate = MyRouterDelegate();
  MyRouteInformationParser _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dimitri LEURS',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}

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

class MyRouterDelegate extends RouterDelegate<AppConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfig> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppConfig currentState = HomeScreen.getConfig();

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppConfig get currentConfiguration {
    return currentState;
  }

  List<Page<dynamic>> buildPage() {
    List<Page<dynamic>> pages = [];
    // is shown even when currentState == null
    pages.add(
      MaterialPage(
        key: ValueKey(HomeScreen.getConfig().hashCode),
        child: HomeScreen(),
      ),
    );
    if (currentState == DetailScreen.getConfig()) {
      pages.add(MaterialPage(
          key: ValueKey(DetailScreen.getConfig().hashCode),
          child: DetailScreen()));
    } else if (currentState == SettingsLanguageScreen.getConfig()) {
      pages.add(MaterialPage(
          key: ValueKey(SettingsLanguageScreen.getConfig().hashCode),
          child: SettingsLanguageScreen()));
    } else if (currentState == UnknownScreen.getConfig()) {
      pages.add(MaterialPage(
          key: ValueKey(UnknownScreen.getConfig().hashCode),
          child: UnknownScreen()));
    }

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    print("MyRouterDelegate building...");
    print(this.currentState);
    return Navigator(
      key: navigatorKey,
      pages: buildPage(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        currentState = HomeScreen.getConfig();
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppConfig newState) async {
    currentState = newState;
    return;
  }

  void toDetailScreen() {
    currentState = DetailScreen.getConfig();
    notifyListeners();
  }

  void toSettingsLanguageScreen() {
    currentState = SettingsLanguageScreen.getConfig();
    notifyListeners();
  }

  void toHomeScreen() {
    currentState = HomeScreen.getConfig();
    notifyListeners();
  }
}

class AppConfig extends Equatable {
  final Uri uri;

  AppConfig({@required this.uri});

  @override
  String toString() {
    String str = "appConfig{ ";
    if (this == null) {
      return str + "null }";
    }
    if (uri.path.isNotEmpty) {
      str += "uri.path{ " + uri.path + " }";
    }
    str += " }";
    return str;
  }

  @override
  List<Object> get props => [uri];
}
