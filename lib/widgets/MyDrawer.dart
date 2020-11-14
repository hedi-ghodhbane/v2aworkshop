import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    @required this.drawerAnimation,
  }) : super(key: key);

  final Animation drawerAnimation;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            drawerAnimation.value * MediaQuery.of(context).size.width * 0.7,
            0,
            0),
        child: Drawer(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).backgroundColor,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text("hello")),
        ));
  }
}
