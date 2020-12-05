import 'package:flutter/material.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/ui/screens/detail_screen.dart';
import 'package:personal_website/ui/screens/home_screen.dart';
import 'package:personal_website/ui/screens/settings_language_screen.dart';
import 'package:personal_website/ui/screens/unknown_screen.dart';

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
