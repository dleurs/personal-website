import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/navigation/app_config.dart';
import 'package:personal_website/navigation/my_router_delegate.dart';
import 'package:personal_website/ui/screens/base_screen.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/"));
  }
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  _launchURL() async {
    const url = 'https://www.linkedin.com/in/dimitri-leurs-666733130/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> nameAndPicture(BuildContext context) {
    return [
      Center(
        child: Text(
          S.of(context).my_name,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      SizedBox(height: 50),
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
        child: Image.asset('assets/images/Dimitri_Leurs_Numberly.jpg'),
      ),
    ];
  }

  List<Widget> linkedinAndThank(BuildContext context) {
    return [
      Center(
        child: Text(
          S.of(context).my_job_title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      Center(
        child: Text(
          S.of(context).my_job_subtitle,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headline6.fontSize * 0.8),
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      Center(
        child: Text(
          S.of(context).contact_me,
          //style: Theme.of(context).textTheme.headline6,
        ),
      ),
      SizedBox(height: Const.mediumPadding),
      GestureDetector(
          onTap: _launchURL,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
            child: Image.asset(
                'assets/images/second_linkedin.jpg'), //Image.asset('assets/images/linkedin.jpg'),
          )),
      SizedBox(height: Const.largePadding),
      Center(
        child: RaisedButton(
          onPressed: () {
            (Router.of(context).routerDelegate as MyRouterDelegate)
                .toDetailScreen();
          },
          child: Text(
            S.of(context).thank_you,
          ),
        ),
      ),
      SizedBox(height: Const.largePadding),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [],
      ),
    ];
  }

  @override
  Widget buildLargeScreen(BuildContext context) {
    return Center(
      child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Const.largePadding),
            Row(children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: nameAndPicture(context),
                  ),
                ),
              ),
              SizedBox(height: Const.largePadding),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(children: linkedinAndThank(context)),
                ),
              ),
            ]),
          ]),
    );
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return Center(
      child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Const.largePadding),
            ...nameAndPicture(context),
            SizedBox(height: Const.largePadding),
            ...linkedinAndThank(context),
          ]),
    );
  }
}
