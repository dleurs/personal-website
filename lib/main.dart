import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/models/scroll_home_screen.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/navigation/route_information_parser.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeNotifier>(
          create: (context) => AppThemeNotifier(),
        ),
        ChangeNotifierProvider<ScrollHomeScreen>(
          create: (context) => ScrollHomeScreen(metricsPixel: 0.0),
        ),
      ],
      child: MyApp(),
    ),
  );
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
    return Consumer<AppThemeNotifier>(
      builder: (context, theme, _) => MaterialApp.router(
        title: 'Dimitri LEURS',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: theme.getTheme(),
        //darkTheme: AppThemeNotifier.darkTheme,
        supportedLocales: S.delegate.supportedLocales,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
