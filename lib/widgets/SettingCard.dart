import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:v2workshop/models/Setting.dart';

class SettingCard extends StatefulWidget {
  final Setting setting;
  const SettingCard({Key key, this.setting}) : super(key: key);
  @override
  _SettingCardState createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              width: 50,
              child: Image.asset(
                widget.setting.image,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: 180,
              child: Text(widget.setting.title,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
            FlutterSwitch(
              width: 45.0,
              height: 25.0,
              toggleSize: 20.0,
              value: status,
              activeColor: widget.setting.color,
              borderRadius: 20.0,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
