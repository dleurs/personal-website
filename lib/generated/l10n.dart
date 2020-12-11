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

  /// `Contactez moi sur Linkedin`
  String get contact_me {
    return Intl.message(
      'Contactez moi sur Linkedin',
      name: 'contact_me',
      desc: '',
      args: [],
    );
  }

  /// `Apprenez-en plus sur moi`
  String get detail_welcoming {
    return Intl.message(
      'Apprenez-en plus sur moi',
      name: 'detail_welcoming',
      desc: '',
      args: [],
    );
  }

  /// `Travail actuellement en CDI chez Numberly`
  String get my_job_subtitle {
    return Intl.message(
      'Travail actuellement en CDI chez Numberly',
      name: 'my_job_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Développeur Flutter`
  String get my_job_title {
    return Intl.message(
      'Développeur Flutter',
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

  /// `Page inconnue`
  String get page_not_found {
    return Intl.message(
      'Page inconnue',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Merci`
  String get thank_you {
    return Intl.message(
      'Merci',
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
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'en'),
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