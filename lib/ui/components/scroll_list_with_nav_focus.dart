import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_website/models/scroll_home_screen.dart';
import 'package:provider/provider.dart';

class ScrollVariables {
  final ScrollController scrollController;
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  final GlobalKey key4;
  ScrollVariables({
    @required this.scrollController,
    @required this.key1,
    @required this.key2,
    @required this.key3,
    @required this.key4,
  });
}

class ScrollListWithNavFocus extends StatefulWidget {
  final Widget child;
  final ScrollVariables v;

  ScrollListWithNavFocus({Key key, @required this.child, @required this.v})
      : super(key: key);

  @override
  _ScrollListWithNavFocusState createState() => _ScrollListWithNavFocusState();
}

class _ScrollListWithNavFocusState extends State<ScrollListWithNavFocus> {
  @override
  Widget build(BuildContext context) {
    ScrollHomeScreen scrollHomeScreenProvided =
        Provider.of<ScrollHomeScreen>(context);
    return Center(
        child: NotificationListener<ScrollEndNotification>(
      child: SingleChildScrollView(
        //mainAxisAlignment: MainAxisAlignment.center,
        controller: widget.v.scrollController,
        child: widget.child,
      ),
      onNotification: (notification) {
        //print(notification);
        //print(notification.metrics.pixels);
        var currentContext = widget.v.key1.currentContext;
        if (currentContext == null) return false;

        var renderObject = currentContext.findRenderObject();
        RenderAbstractViewport viewport =
            RenderAbstractViewport.of(renderObject);
        var offsetToRevealBottom =
            viewport.getOffsetToReveal(renderObject, 1.0);
        var offsetToRevealTop = viewport.getOffsetToReveal(renderObject, 0.0);
        if (offsetToRevealBottom.offset > notification.metrics.pixels ||
            notification.metrics.pixels > offsetToRevealTop.offset) {
          print("First Part not visible");
        } else {
          print("First Part visible");
        }
        return false;
      },
    ));
  }
}
