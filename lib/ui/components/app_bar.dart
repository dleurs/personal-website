import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/utils/constant.dart';

class MyAppBar {
  static List<Widget> buildActions(
      {@required BuildContext context,
      @required Function(String) setLanguage}) {
    List<Widget> actions = <Widget>[];
    String intlCurrentLang = Intl.getCurrentLocale();
    actions.add(Theme(
      data: Theme.of(context).copyWith(
        cardColor: AppColors.primaryLight,
      ),
      child: PopupMenuButton<MenuIconLanguage>(
        icon: (intlCurrentLang == "fr")
            ? Image.asset('assets/images/uk-flag.jpg')
            : (intlCurrentLang == "ru")
                ? Image.asset('assets/images/ru-flag.jpg')
                : Image.asset('assets/images/uk-flag.jpg'),
        iconSize: Const.actionNavBarIconSize,
        onSelected: (menuLang) {
          setLanguage(menuLang.countryCode);
        },
        itemBuilder: (BuildContext context) {
          return listMenuLang.map((MenuIconLanguage menuLang) {
            return PopupMenuItem<MenuIconLanguage>(
              value: menuLang,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: menuLang.iconSize),
                    child: menuLang.icon),
              ),
            );
          }).toList();
        },
      ),
    ));
    return actions;
  }
}

class MenuIconLanguage {
  Widget icon;
  double iconSize;
  String countryCode;
  MenuIconLanguage(
      {@required this.icon,
      this.iconSize = Const.actionNavBarIconSize,
      @required this.countryCode});
}

List<MenuIconLanguage> listMenuLang = <MenuIconLanguage>[
  MenuIconLanguage(
      icon: Image.asset('assets/images/uk-flag.jpg'), countryCode: "uk"),
  MenuIconLanguage(
      icon: Image.asset('assets/images/ru-flag.jpg'), countryCode: "ru"),
  MenuIconLanguage(
      icon: Image.asset(
        'assets/images/fr-flag.jpg',
      ),
      countryCode: "fr"),
];
