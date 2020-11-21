import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: 'My Flutter App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
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
        key: ValueKey('FirstPage'),
        child: FirstScreen(),
      ),
    );
    if (currentState == null || currentState.isUnknown) {
      pages.add(
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen()));
    } else if (currentState.isSecondPage) {
      // Must be at the end in order to show NavBar back button when 404
      pages.add(
          MaterialPage(key: ValueKey('SecondPage'), child: SecondScreen()));
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

  void _handleTapped(void nothing) {
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

class FirstScreen extends StatelessWidget {
  _launchURL() async {
    const url = 'https://www.linkedin.com/in/dimitri-leurs-666733130/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                "Dimitri Leurs",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(height: 50),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
              child: Image.asset('assets/images/Dimitri_Leurs_Numberly.jpg'),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                "Developpeur Flutter - Actuellement chez Numerbly",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                "Contact me on Linkedin :",
                //style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: _launchURL,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
                  child: Image.asset('assets/images/linkedin.jpg'),
                )),
            SizedBox(height: 50),
            Center(
              child: RaisedButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      ._handleTapped(null);
                },
                child: Text(
                  "Have a nice day :)",
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Know me better",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Page not found",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
