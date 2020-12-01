import 'package:flutter/material.dart';
import 'package:personal_website/generated/l10n.dart';
import 'package:personal_website/main.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  _launchURL() async {
    const url = 'https://www.linkedin.com/in/dimitri-leurs-666733130/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
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
            SizedBox(height: 50),
            Center(
              child: Text(
                S.of(context).my_job_title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                S.of(context).my_job_subtitle,
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headline6.fontSize * 0.8),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                S.of(context).contact_me,
                //style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: _launchURL,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
                  child: Image.asset(
                      'assets/images/second_linkedin.jpg'), //Image.asset('assets/images/linkedin.jpg'),
                )),
            SizedBox(height: 50),
            Center(
              child: RaisedButton(
                onPressed: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .handleTapped(null);
                },
                child: Text(
                  S.of(context).thank_you,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
