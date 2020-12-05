import 'package:flag/flag.dart';
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
            SizedBox(
              width: 250,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale("en"));
                  });
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .toHomeScreen();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flag("GB", height: 20, width: 35, fit: BoxFit.fill),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("To English",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    S.load(Locale("fr"));
                  });
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .toHomeScreen();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flag("FR", height: 20, width: 35, fit: BoxFit.fill),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("En français",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              child: Flexible(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      S.load(Locale("ru"));
                    });
                    (Router.of(context).routerDelegate as MyRouterDelegate)
                        .toHomeScreen();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flag("RU", height: 20, width: 35, fit: BoxFit.fill),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("На русском",
                            style: Theme.of(context).textTheme.headline5),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
