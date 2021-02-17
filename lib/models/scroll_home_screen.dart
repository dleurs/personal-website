import 'package:flutter/material.dart';

class ScrollHomeScreen with ChangeNotifier {
  double metricsPixel;
  ScrollHomeScreen({this.metricsPixel});
  ScrollHomeScreen.getLocal() {
    metricsPixel = 0;
/*     StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      } */
    notifyListeners();
    //});
  }

  void updateMetricPixel(double metricsPixel) {
    this.metricsPixel = metricsPixel;
    notifyListeners();
  }

  String toString() {
    String res = "ScrollHomeScreen{";
    res += "metricsPixel:$metricsPixel";
    res += "}";
    return res;
  }
}
