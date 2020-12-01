import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/screens/detail_screen.dart';
import 'package:personal_website/screens/home_screen.dart';
import 'package:personal_website/screens/unknown_screen.dart';

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
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return AppConfig.firstPage();
    }

    // Handle '/second'
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'second') return AppConfig.secondPage();
    }

    // Handle unknown routes
    return AppConfig.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppConfig state) {
    if (state.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (state.isFirstPage) {
      return RouteInformation(location: '/');
    }
    if (state.isSecondPage) {
      return RouteInformation(location: '/second');
    }
    return null;
  }
}

class MyRouterDelegate extends RouterDelegate<AppConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfig> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppConfig currentState = AppConfig.firstPage();

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppConfig get currentConfiguration {
    return currentState;
  }

  List<Page<dynamic>> buildPage() {
    List<Page<dynamic>> pages = [];
    // is shown even when currentState == null
    pages.add(
      MaterialPage(
        key: ValueKey('HomeScreen'),
        child: HomeScreen(),
      ),
    );
    if (currentState == null || currentState.isUnknown) {
      pages.add(
          MaterialPage(key: ValueKey('UnknownScreen'), child: UnknownScreen()));
    } else if (currentState.isSecondPage) {
      // Must be at the end in order to show NavBar back button when 404
      pages.add(
          MaterialPage(key: ValueKey('DetailScreen'), child: DetailScreen()));
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
        currentState = AppConfig.firstPage();
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

  void handleTapped(void nothing) {
    currentState = AppConfig.secondPage();
    notifyListeners();
  }
}

class AppConfig {
  final bool showSecondPage;
  final bool unknown;

  AppConfig.firstPage()
      : showSecondPage = false,
        unknown = false;

  AppConfig.secondPage()
      : showSecondPage = true,
        unknown = false;

  AppConfig.unknown()
      : showSecondPage = false,
        unknown = true;

  bool get isFirstPage => (!isUnknown && showSecondPage == false);

  bool get isSecondPage => (!isUnknown && showSecondPage == true);

  bool get isUnknown => (unknown == true);

  @override
  String toString() {
    String str = "currentState{ ";
    if (this == null) {
      return str + "null }";
    }
    if (isUnknown) {
      str += "isUnknown";
    } else {
      if (isFirstPage) {
        str += "firstPage";
      } else {
        str += "secondPage";
      }
    }
    str += " }";
    return str;
  }
}
