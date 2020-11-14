import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v2workshop/widgets/SettingCard.dart';
import 'package:v2workshop/models/Setting.dart';
import 'package:v2workshop/widgets/StatCard.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key key,
    @required this.animation,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final Animation animation;
  final AnimationController _controller;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _settings = [
    Setting(
        title: "Notifications",
        image: 'assets/design.png',
        color: Color(0xFFC56D86)),
    Setting(
        title: "Reminders",
        image: 'assets/media.png',
        color: Color(0xFF345C7D)),
    Setting(
        title: "Help & Support",
        image: 'assets/psy.png',
        color: Color(0xFF3AF3E7)),
    Setting(
      title: "HAJA okhra wooow haka",
      image: 'assets/work.png',
      color: Colors.lightGreen,
    )
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
            width: 80,
            child: Row(
              children: [
                Text('Profile', style: Theme.of(context).textTheme.bodyText1),
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
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          child: Image.asset('assets/media.png'),
                        ),
                      ),
                      Text('Ahmed Klai',
                          style: Theme.of(context).textTheme.bodyText1),
                      Text('Flutter dev',
                          style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          StatCard(),
                          SizedBox(
                            width: 20,
                          ),
                          StatCard()
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SettingCard(
                                  setting: _settings[i % _settings.length]),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
