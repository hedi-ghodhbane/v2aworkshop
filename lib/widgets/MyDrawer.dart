import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key key,
    @required this.drawerAnimation,
  }) : super(key: key);

  final Animation drawerAnimation;
  final List<Map<String, String>> items = [
    {"image": "assets/design.png", "title": "Work"},
    {"image": "assets/psy.png", "title": "Study"},
    {"image": "assets/media.png", "title": "Ideas"},
  ];
  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(
            drawerAnimation.value * MediaQuery.of(context).size.width * 0.7,
            0,
            0),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            height: MediaQuery.of(context).size.height,
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width * 0.7,
            child: SafeArea(
                child: ListView.separated(
                    separatorBuilder: (_, __) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    padding: EdgeInsets.all(3.0),
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      if (index == 6)
                        return RaisedButton(
                            color: Color(0xFFFF7582),
                            textColor: Colors.white,
                            onPressed: () {},
                            child: Text("Add list"));
                      return Card(
                        child: ListTile(
                          leading:
                              Image.asset(items[index % items.length]["image"]),
                          title: Text(items[index % items.length]["title"]),
                        ),
                      );
                    }))));
  }
}
