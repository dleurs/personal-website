import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/components/flutter_icon_com_icons.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar {
  static List<Widget> buildActions({
    @required BuildContext context,
    @required Function(String) setLanguage,
  }) {
    List<Widget> actions = <Widget>[];
    String intlCurrentLang = Intl.getCurrentLocale();
    AppThemeNotifier theme =
        Provider.of<AppThemeNotifier>(context, listen: false);
    print("theme : " + theme.toString());

    actions.add(SizedBox(
      width:
          110, // Qpproximatly the size of Flag + switch to center other elements
    ));

    actions.add(Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toHomeScreen();
            },
            color: theme.getTheme().focusColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Icon(FlutterIconCom.resume_and_cv),
                  ),
                  Flexible(
                    child: Text(
                      "Resume",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
          FlatButton(
            onPressed: () {
              (Router.of(context).routerDelegate as MyRouterDelegate)
                  .toHomeScreen();
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Icon(Icons.mobile_friendly_outlined),
                  ),
                  Flexible(
                    child: Text(
                      "Projects",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
          FlatButton(
            onPressed: () {},
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Icon(FlutterIconCom.time_is_money_3_),
                  ),
                  Flexible(
                    child: Text(
                      "Time & Price",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
          FlatButton(
            onPressed: () {},
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Icon(FlutterIconCom.conversation),
                  ),
                  Flexible(
                    child: Text(
                      "Contact me",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    ));

    actions.add(
      Row(
        children: [
          Switch(
            value: theme.isBlack(),
            onChanged: (value) {
              if (value) {
                theme.setDarkMode();
              } else {
                theme.setLightMode();
              }
            },
            inactiveThumbImage: AssetImage('assets/images/moon.png'),
            activeThumbImage: AssetImage('assets/images/moon.png'),
          ),
        ],
      ),
    );

    actions.add(PopupMenuButton<MenuIconLanguage>(
      icon: getFlag(intlCurrentLang),
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
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    Container(
                      child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: menuLang.iconSize),
                          child: menuLang.icon),
                    ),
                    SizedBox(
                      width: Const.smallPadding,
                    ),
                    Text(getLangName(context, menuLang.countryCode)),
                    (intlCurrentLang != menuLang.countryCode)
                        ? Text(" - " + menuLang.countryLangName)
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      },
    ));

    return actions;
  }
}

class MenuIconLanguage {
  Widget icon;
  double iconSize;
  String countryCode;
  String countryLangName;
  MenuIconLanguage(
      {@required this.icon,
      this.iconSize = Const.actionNavBarIconSize,
      @required this.countryCode,
      @required this.countryLangName});
}

List<MenuIconLanguage> listMenuLang = <MenuIconLanguage>[
  MenuIconLanguage(
      icon: Image.asset('assets/images/uk-flag.jpg'),
      countryCode: "en",
      countryLangName: "English"),
  MenuIconLanguage(
      icon: Image.asset('assets/images/ru-flag.jpg'),
      countryCode: "ru",
      countryLangName: "Русский"),
  MenuIconLanguage(
      icon: Image.asset(
        'assets/images/fr-flag.jpg',
      ),
      countryCode: "fr",
      countryLangName: "Français"),
];

Widget getFlag(String countryCode) {
  for (MenuIconLanguage country in listMenuLang) {
    if (country.countryCode == countryCode) return country.icon;
  }
  return SizedBox();
}

String getLangName(BuildContext context, String countryCode) {
  if (countryCode == "fr") {
    return S.of(context).french_language;
  } else if (countryCode == "en") {
    return S.of(context).english_language;
  } else if (countryCode == "ru") {
    return S.of(context).russian_language;
  } else
    return "Unknown";
}
