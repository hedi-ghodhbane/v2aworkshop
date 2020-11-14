import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v2workshop/screens/TabController.dart';
import 'package:v2workshop/widgets/MyDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFFDBE9E8),
            canvasColor: Colors.white,
            textTheme: TextTheme(
                bodyText1: TextStyle(fontSize: 25, color: Color(0xFF707070))),
            backgroundColor: Color(0xFF345C7D)),
        home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;
  Animation drawerAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    drawerAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Stack(children: [
          MyDrawer(drawerAnimation: drawerAnimation),
          LandingScreen(animation: animation, controller: _controller),
        ]);
      },
    );
  }
}
