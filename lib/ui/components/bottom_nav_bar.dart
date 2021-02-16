import 'package:flutter/material.dart';
import 'package:personal_website/ui/components/language_items.dart';
import 'package:personal_website/ui/components/nav_items.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    AppThemeNotifier theme =
        Provider.of<AppThemeNotifier>(context, listen: false);
    return BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        unselectedItemColor: theme.getTheme().hintColor,
        unselectedLabelStyle: TextStyle(
          color: theme.getTheme().hintColor,
        ),
        unselectedFontSize: 14.0,
        showUnselectedLabels: true,
        selectedItemColor: theme.getTheme().accentColor,
        selectedLabelStyle: TextStyle(
          color: theme.getTheme().accentColor,
        ),
        selectedFontSize: 14.0,

        //backgroundColor: theme.getTheme().accentColor,
        //type: BottomNavigationBarType.fixed,
        items: NavItems.navItems.map((NavItem navItem) {
          return BottomNavigationBarItem(
            icon: navItem.icon,
            label: NavItems.getNavItemName(context, navItem.nameCode),
          );
        }).toList());
  }
}
