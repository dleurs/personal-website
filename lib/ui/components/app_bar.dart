import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/main.dart';

class MyAppBar {
  static List<Widget> buildActions({@required BuildContext context}) {
    if (Intl.getCurrentLocale() == "fr") {
      return [
        IconButton(
            icon: Flag("FR", fit: BoxFit.fill),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    } else if (Intl.getCurrentLocale() == "ru") {
      return [
        IconButton(
            icon: Flag("RU", fit: BoxFit.fill),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    } else {
      return [
        IconButton(
            icon: Flag("GB", fit: BoxFit.fill),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    }
  }
}
