import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:provider/provider.dart';

class MyAppBar {
  static List<Widget> buildActions({
    @required BuildContext context,
    @required Function(String) setLanguage,
  }) {
    List<Widget> actions = <Widget>[];
    String intlCurrentLang = Intl.getCurrentLocale();
    AppThemeNotifier theme = Provider.of<AppThemeNotifier>(context);
    print("theme : " + theme.toString());

/*     actions.add(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.all(0.0),
            icon: Icon(Icons.ac_unit_rounded),
            iconSize: Const.actionNavBarIconSize * 0.6,
            onPressed: () {},
          ),
          Text("Mail")
        ])); */

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
      icon: (intlCurrentLang == "fr")
          ? Image.asset('assets/images/fr-flag.jpg')
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
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                      ),
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
      countryLangName: "Русский "),
  MenuIconLanguage(
      icon: Image.asset(
        'assets/images/fr-flag.jpg',
      ),
      countryCode: "fr",
      countryLangName: "Français"),
];

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
