import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/utils/constant.dart';

class LanguageItem {
  Widget icon;
  double iconSize;
  String countryCode;
  String countryLangName;
  LanguageItem(
      {@required this.icon,
      this.iconSize = Const.actionNavBarIconSize,
      @required this.countryCode,
      @required this.countryLangName});
}

class LanguageItems {
  static List<LanguageItem> navItems = <LanguageItem>[
    LanguageItem(
        icon: Image.asset(
          'assets/images/uk-flag.jpg',
        ),
        countryCode: "en",
        countryLangName: "English"),
    LanguageItem(
        icon: Image.asset('assets/images/ru-flag.jpg'),
        countryCode: "ru",
        countryLangName: "Русский"),
    LanguageItem(
        icon: Image.asset(
          'assets/images/fr-flag.jpg',
        ),
        countryCode: "fr",
        countryLangName: "Français"),
  ];

  static Widget getFlag(String countryCode) {
    for (LanguageItem country in navItems) {
      if (country.countryCode == countryCode) return country.icon;
    }
    return SizedBox();
  }

  static String getLangName(BuildContext context, String countryCode) {
    if (countryCode == "fr") {
      return S.of(context).french_language;
    } else if (countryCode == "en") {
      return S.of(context).english_language;
    } else if (countryCode == "ru") {
      return S.of(context).russian_language;
    } else
      return "Unknown";
  }
}
