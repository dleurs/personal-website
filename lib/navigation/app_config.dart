import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppConfig extends Equatable {
  final Uri uri;

  AppConfig({@required this.uri});

  @override
  String toString() {
    String str = "appConfig{ ";
    if (this == null) {
      return str + "null }";
    }
    if (uri.path.isNotEmpty) {
      str += "uri.path{ " + uri.path + " }";
    }
    str += " }";
    return str;
  }

  @override
  List<Object> get props => [uri];
}
