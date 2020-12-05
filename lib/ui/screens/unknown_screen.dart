import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  final String fullPath = '/404';
  final String lastPath = '404';
  final int urlSection = 1;
  final String valueKey = "ValueKey";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Page not found",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
