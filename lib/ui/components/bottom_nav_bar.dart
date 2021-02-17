import 'package:flutter/material.dart';
import 'package:personal_website/models/nav_items.dart';
import 'package:personal_website/ui/theme.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  final Function() pressFirstNavItem;
  BottomNavBar({@required this.pressFirstNavItem});

  void Function(int index) callCallback() {
    return (index) {
      pressFirstNavItem();
    };
  }

  @override
  Widget build(BuildContext context) {
    AppThemeNotifier theme =
        Provider.of<AppThemeNotifier>(context, listen: false);
    return BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: callCallback(),
        unselectedItemColor: theme?.getTheme()?.hintColor ?? Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: theme?.getTheme()?.hintColor ?? Colors.grey,
        ),
        unselectedFontSize: 14.0,
        showUnselectedLabels: true,
        selectedItemColor: theme?.getTheme()?.accentColor ?? Colors.blue,
        selectedLabelStyle: TextStyle(
          color: theme?.getTheme()?.accentColor ?? Colors.blue,
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
