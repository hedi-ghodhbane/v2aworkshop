import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v2workshop/models/Todo.dart';
import 'package:v2workshop/widgets/TodoCard.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    Key key,
    @required this.animation,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final Animation animation;
  final AnimationController _controller;

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _todos = [
    Todo(
        title: "Todo App Design for android club",
        time: '10:00 AM - 12:30 AM',
        percentage: 20,
        image: 'design.png',
        color: Color(0xFFC56D86)),
    Todo(
        title: "Fix the intro for youtue in AE",
        time: '10:00 AM - 12:30 AM',
        percentage: 20,
        image: 'media.png',
        color: Color(0xFF345C7D)),
    Todo(
        title: "Start the psy in coursera",
        time: '10:00 AM - 12:30 AM',
        percentage: 20,
        image: 'psy.png',
        color: Color(0xFF3AF3E7)),
  ];
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
          widget.animation.value * MediaQuery.of(context).size.width * 0.7,
          0,
          0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            width: 130,
            child: Row(
              children: [
                Text('Work', style: Theme.of(context).textTheme.bodyText1),
                Container(
                  width: 50,
                  child: Image.asset(
                    'assets/work.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          elevation: 0,
          leading: IconButton(
              icon: SvgPicture.asset('assets/menu.svg'),
              onPressed: () {
                if (widget._controller.isCompleted)
                  widget._controller..reverse();
                else {
                  widget._controller.forward();
                }
              }),
        ),
        body: Container(
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, i) {
                  return TodoCard(todo: _todos[i % _todos.length]);
                })),
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
      ),
    );
  }
}
