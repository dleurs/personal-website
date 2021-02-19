import 'package:flutter/material.dart';
import 'package:personal_website/utils/local_storage.dart';
import 'package:provider/provider.dart';

class AppColors {
  static const Color primary = Colors.blue;
}

class AppThemeNotifier with ChangeNotifier {
  static ThemeData get lightTheme {
    ThemeData theme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
    );
    return theme;
  }

  static ThemeData get darkTheme {
    ThemeData theme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
    );
    return theme;
  }

  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  bool isBlack() {
    if (_themeData == null) {
      return false;
    }
    return (_themeData.brightness == Brightness.dark);
  }

  AppThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  String toString() {
    String str = "AppThemeNotifier{";
    str += (_themeData?.brightness?.toString() ?? "null");
    str += "}";
    return str;
  }
}
