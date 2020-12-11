import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/utils/constant.dart';

class MyAppBar {
  static List<Widget> buildActions({@required BuildContext context}) {
    if (Intl.getCurrentLocale() == "fr") {
      return [
        IconButton(
            iconSize: Const.actionNavBarIconSize,
            icon: Image.asset(
              'assets/images/fr-flag.jpg',
            ),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    } else if (Intl.getCurrentLocale() == "ru") {
      return [
        IconButton(
            iconSize: Const.actionNavBarIconSize,
            icon: Image.asset('assets/images/ru-flag.jpg'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    } else {
      return [
        IconButton(
            iconSize: Const.actionNavBarIconSize,
            icon: Image.asset('assets/images/uk-flag.jpg'),
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toSettingsLanguageScreen();
            })
      ];
    }
  }
}
