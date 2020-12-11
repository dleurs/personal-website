import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/screens/base_screen.dart';

class SettingsLanguageScreen extends StatefulWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/settings/language"));
  }

  @override
  _SettingsLanguageScreenState createState() => _SettingsLanguageScreenState();
}

class _SettingsLanguageScreenState
    extends BaseScreenState<SettingsLanguageScreen> {
  @override
  Widget buildLargeScreen(BuildContext context) {
    return Center(
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
                  Image.asset('assets/images/uk-flag.jpg',
                      height: 20, width: 35),
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
                  Image.asset('assets/images/fr-flag.jpg',
                      height: 20, width: 35),
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
                  Image.asset('assets/images/ru-flag.jpg',
                      height: 20, width: 35),
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
          )
        ],
      ),
    );
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return buildLargeScreen(context);
  }
}
