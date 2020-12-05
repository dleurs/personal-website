import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_icons/country_icons.dart';

class MyAppBar {
  static List<Widget> buildActions() {
    if (Intl.getCurrentLocale() == "fr") {
      return [
        IconButton(
            icon:
                Image.asset('icons/flags/png/fr.png', package: 'country_icons'),
            onPressed: () {})
      ];
    } else if (Intl.getCurrentLocale() == "ru") {
      return [
        IconButton(
            icon:
                Image.asset('icons/flags/png/ru.png', package: 'country_icons'),
            onPressed: () {})
      ];
    } else {
      return [
        IconButton(
            icon:
                Image.asset('icons/flags/png/en.png', package: 'country_icons'),
            onPressed: () {})
      ];
    }
  }
}
