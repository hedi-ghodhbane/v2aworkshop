import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xFFDBE9E8),
            canvasColor: Colors.white,
            backgroundColor: Color(0xFF345C7D)),
        home: Main());
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      ),
      body: Container(color: Theme.of(context).primaryColor),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFE8978), Color(0xFFFF7582)])),
        child: FloatingActionButton(
          onPressed: () {
            print("hello");
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
