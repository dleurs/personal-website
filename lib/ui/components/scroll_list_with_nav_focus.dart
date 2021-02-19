import 'package:flutter/material.dart';

class ScrollListWithNavFocus extends StatefulWidget {
  final Widget child;
  ScrollController scrollController;

  ScrollListWithNavFocus(
      {Key key, @required this.child, @required this.scrollController})
      : super(key: key);

  @override
  _ScrollListWithNavFocusState createState() => _ScrollListWithNavFocusState();
}

class _ScrollListWithNavFocusState extends State<ScrollListWithNavFocus> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: NotificationListener<ScrollEndNotification>(
      child: SingleChildScrollView(
        //mainAxisAlignment: MainAxisAlignment.center,
        controller: widget.scrollController,
        child: widget.child,
      ),
      onNotification: (notification) {
        print(notification.metrics.pixels);
        return true;
      },
    ));
  }
}
