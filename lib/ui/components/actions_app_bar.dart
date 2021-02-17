import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/models/language_items.dart';
import 'package:personal_website/models/nav_items.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:provider/provider.dart';

class MyAppBar {
  static List<Widget> buildActions({
    @required BuildContext context,
    @required Function(String) setLanguage,
    @required bool displayNavItems,
  }) {
    List<Widget> actions = <Widget>[];
    String intlCurrentLang = Intl.getCurrentLocale();
    AppThemeNotifier theme =
        Provider.of<AppThemeNotifier>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    //print("theme : " + theme.toString());

    if (displayNavItems) {
      actions.add(Padding(
        padding: EdgeInsets.only(
            right: screenWidth * (screenWidth * 0.0002192 - 0.0925)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: NavItems.navItems.map((NavItem navItem) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: FlatButton(
                  onPressed: () {
                    navItem.onPressed(context);
                  },
                  //color: theme.getTheme().focusColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: navItem.icon,
                        ),
                        Flexible(
                          child: Text(
                            NavItems.getNavItemName(context, navItem.nameCode),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                ),
              );
            }).toList()),
      ));
    }

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

    actions.add(PopupMenuButton<LanguageItem>(
      icon: LanguageItems.getFlag(intlCurrentLang),
      iconSize: Const.actionNavBarIconSize,
      onSelected: (menuLang) {
        setLanguage(menuLang.countryCode);
      },
      itemBuilder: (BuildContext context) {
        return LanguageItems.navItems.map((LanguageItem navItem) {
          return PopupMenuItem<LanguageItem>(
            value: navItem,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    Container(
                      child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: navItem.iconSize),
                          child: navItem.icon),
                    ),
                    SizedBox(
                      width: Const.smallPadding,
                    ),
                    Text(LanguageItems.getLangName(
                        context, navItem.countryCode)),
                    (intlCurrentLang != navItem.countryCode)
                        ? Text(" - " + navItem.countryLangName)
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
