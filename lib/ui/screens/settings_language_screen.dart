import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/main.dart';

class SettingsLanguageScreen extends StatefulWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/settings/language"));
  }

  @override
  _SettingsLanguageScreenState createState() => _SettingsLanguageScreenState();
}

class _SettingsLanguageScreenState extends State<SettingsLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  S.load(Locale("en"));
                });
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .toHomeScreen();
              },
              child: Text("To English"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  S.load(Locale("fr"));
                });
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .toHomeScreen();
              },
              child: Text("En français"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  S.load(Locale("ru"));
                });
                (Router.of(context).routerDelegate as MyRouterDelegate)
                    .toHomeScreen();
              },
              child: Text("На русском"),
            )
          ],
        ),
      ),
    );
  }
}
