import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/components/flutter_icon_com_icons.dart';

enum NavPart { resume, projects, timeMoney, contactMe }

class NavItem {
  IconData iconData;
  String nameCode;
  int scrollIndex; // Only used for top AppBar. Fixed for BottomNavBar.
  NavItem({
    @required this.iconData,
    @required this.nameCode,
    @required this.scrollIndex,
  });
}

int navPartToInt(NavPart navPart) {
  // For BottomNavBar
  if (navPart == NavPart.resume) {
    return 0;
  } else if (navPart == NavPart.projects) {
    return 1;
  } else if (navPart == NavPart.timeMoney) {
    return 2;
  } else if (navPart == NavPart.contactMe) {
    return 3;
  }
  return null;
}

class NavItems {
  static List<NavItem> navItems = <NavItem>[
    NavItem(
        iconData: FlutterIconCom.resume,
        nameCode: "resume_nav_item",
        scrollIndex: 0),
    NavItem(
        iconData: FlutterIconCom.smartphone_original,
        nameCode: "projects_nav_item",
        scrollIndex: 1),
    NavItem(
        iconData: FlutterIconCom.time_is_money,
        nameCode: "time_money_nav_item",
        scrollIndex: 2),
    NavItem(
        iconData: FlutterIconCom.bubble_speak,
        nameCode: "contact_me_nav_item",
        scrollIndex: 3),
  ];

  static String getNavItemName(BuildContext context, String nameCode) {
    if (nameCode == "resume_nav_item") {
      return S.of(context).resume_nav_item;
    } else if (nameCode == "projects_nav_item") {
      return S.of(context).projects_nav_item;
    } else if (nameCode == "time_money_nav_item") {
      return S.of(context).time_money_nav_item;
    } else if (nameCode == "contact_me_nav_item") {
      return S.of(context).contact_me_nav_item;
    } else
      return "Unknown";
  }
}
