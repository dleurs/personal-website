import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/ui/screens/base_screen.dart';

class DetailScreen extends StatefulWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/details"));
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends BaseScreenState<DetailScreen> {
  @override
  Widget buildLargeScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).detail_welcoming,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return buildLargeScreen(context);
  }
}
