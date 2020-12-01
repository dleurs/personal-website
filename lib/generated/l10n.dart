// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Contact me on Linkedin`
  String get contact_me {
    return Intl.message(
      'Contact me on Linkedin',
      name: 'contact_me',
      desc: '',
      args: [],
    );
  }

  /// `Currently working at Numberly`
  String get my_job_subtitle {
    return Intl.message(
      'Currently working at Numberly',
      name: 'my_job_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Flutter developer`
  String get my_job_title {
    return Intl.message(
      'Flutter developer',
      name: 'my_job_title',
      desc: '',
      args: [],
    );
  }

  /// `Dimitri Leurs`
  String get my_name {
    return Intl.message(
      'Dimitri Leurs',
      name: 'my_name',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thank_you {
    return Intl.message(
      'Thank you',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}