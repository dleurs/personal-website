import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/ui/screens/base_screen.dart';

class UnknownScreen extends StatefulWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/unknown"));
  }

  @override
  _UnknownScreenState createState() => _UnknownScreenState();
}

class _UnknownScreenState extends BaseScreenState<UnknownScreen> {
  @override
  Widget buildLargeScreen(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).page_not_found,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return buildLargeScreen(context);
  }
}
