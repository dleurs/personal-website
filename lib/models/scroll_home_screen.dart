import 'package:flutter/material.dart';
import 'dart:math';

import 'package:personal_website/models/nav_items.dart';

class ScrollHomeScreen with ChangeNotifier {
  double metricsPixel;
  NavPart focusOn;
  double visibleFractionResume;
  double visibleFractionProjects;
  double visibleFractionTimeMoney;
  double visibleFractionRecommandation;
  double visibleFractionContactMe;

  ScrollHomeScreen({
    this.metricsPixel,
    this.focusOn = NavPart.resume,
    this.visibleFractionResume =
        0.51, // arbitrary set up 0.51, coulb have been 0.1 or 0.9
    this.visibleFractionProjects = 0.0,
    this.visibleFractionTimeMoney = 0.0,
    this.visibleFractionRecommandation = 0.0,
    this.visibleFractionContactMe = 0.0,
  }); //TODO assert only one of focuses is true;
  ScrollHomeScreen.getLocal() {
    /* metricsPixel = 0;
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
    });*/
  }

  NavPart getMax() {
    List<double> variablesFraction = [
      visibleFractionResume,
      visibleFractionProjects,
      visibleFractionTimeMoney,
      visibleFractionRecommandation,
      visibleFractionContactMe
    ];
    double maxFrac = variablesFraction.reduce(max);
    if (maxFrac == visibleFractionResume) {
      return NavPart.resume;
    } else if (maxFrac == visibleFractionProjects) {
      return NavPart.projects;
    } else if (maxFrac == visibleFractionTimeMoney) {
      return NavPart.timeMoney;
    } else if (maxFrac == visibleFractionRecommandation) {
      return NavPart.recommandation;
    } else if (maxFrac == visibleFractionContactMe) {
      return NavPart.contactMe;
    }
  }

  NavPart updateVisibleFraction(NavPart navPart, double visibleFraction) {
    if (navPart == NavPart.resume) {
      this.visibleFractionResume = visibleFraction;
    } else if (navPart == NavPart.projects) {
      this.visibleFractionProjects = visibleFraction;
    } else if (navPart == NavPart.timeMoney) {
      this.visibleFractionTimeMoney = visibleFraction;
    } else if (navPart == NavPart.recommandation) {
      this.visibleFractionRecommandation = visibleFraction;
    } else if (navPart == NavPart.contactMe) {
      this.visibleFractionContactMe = visibleFraction;
    }
    NavPart actualMax = getMax();
    focusOn = actualMax;
    notifyListeners();
    return actualMax;
  }

  void setNewVisible(int navNum) {
    focusOn = intToNavPart(navNum);
    notifyListeners();
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
