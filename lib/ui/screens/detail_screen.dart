import 'package:flutter/material.dart';
import 'package:personal_website/main.dart';

class DetailScreen extends StatefulWidget {
  static AppConfig getConfig() {
    return AppConfig(uri: Uri(path: "/details"));
  }

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Know me better",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
