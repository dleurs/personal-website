import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/components/flutter_icon_com_icons.dart';
import 'package:personal_website/ui/components/language_items.dart';
import 'package:personal_website/ui/components/nav_items.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    //print("theme : " + theme.toString());

    if (displayNavItems) {
      actions.add(SizedBox(
        width:
            110, // Qpproximatly the size of Flag + switch to center other elements
      ));
      actions.add(Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: NavItems.navItems.map((NavItem navItem) {
              return FlatButton(
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
