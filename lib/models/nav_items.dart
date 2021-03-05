import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/components/flutter_icon_com_icons.dart';

enum NavPart { resume, projects, timeMoney, recommandation, contactMe }

class NavItem {
  IconData iconData;
  NavPart navPart;
  int scrollIndex; // Only used for top AppBar. Fixed for BottomNavBar.
  NavItem({
    @required this.iconData,
    @required this.navPart,
    @required this.scrollIndex,
  });
}

class NavItems {
  static List<NavItem> navItems = <NavItem>[
    NavItem(
        iconData: FlutterIconCom.resume,
        navPart: NavPart.resume,
        scrollIndex: 0),
    NavItem(
        iconData: FlutterIconCom.smartphone_original,
        navPart: NavPart.projects,
        scrollIndex: 1),
    NavItem(
        iconData: FlutterIconCom.time_is_money,
        navPart: NavPart.timeMoney,
        scrollIndex: 2),
    NavItem(
        iconData: FlutterIconCom.motivation,
        navPart: NavPart.recommandation,
        scrollIndex: 3),
    NavItem(
        iconData: FlutterIconCom.bubble_speak,
        navPart: NavPart.contactMe,
        scrollIndex: 4),
  ];

  static String getNavItemName(BuildContext context, NavPart navPart) {
    if (navPart == NavPart.resume) {
      return S.of(context).resume_nav_item;
    } else if (navPart == NavPart.projects) {
      return S.of(context).projects_nav_item;
    } else if (navPart == NavPart.timeMoney) {
      return S.of(context).time_money_nav_item;
    } else if (navPart == NavPart.recommandation) {
      return S.of(context).recommandation_nav_item;
    } else if (navPart == NavPart.contactMe) {
      return S.of(context).contact_me_nav_item;
    } else
      return "Unknown";
  }
}

int navPartToInt(NavPart navPart) {
  // For BottomNavBar
  if (navPart == NavPart.resume) {
    return 0;
  } else if (navPart == NavPart.projects) {
    return 1;
  } else if (navPart == NavPart.timeMoney) {
    return 2;
  } else if (navPart == NavPart.recommandation) {
    return 3;
  } else if (navPart == NavPart.contactMe) {
    return 4;
  }
  return null;
}

NavPart intToNavPart(int navNum) {
  // For BottomNavBar
  if (navNum == 0) {
    return NavPart.resume;
  } else if (navNum == 1) {
    return NavPart.projects;
  } else if (navNum == 2) {
    return NavPart.timeMoney;
  } else if (navNum == 3) {
    return NavPart.recommandation;
  } else if (navNum == 4) {
    return NavPart.contactMe;
  }
  return null;
}
