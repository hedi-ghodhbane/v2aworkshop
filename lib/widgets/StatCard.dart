import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  @override
  _StatCardState createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 135,
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
            Icon(
              Icons.done_all,
              color: Colors.pinkAccent,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('Done', style: Theme.of(context).textTheme.bodyText2),
                Text('15683',
                    style: TextStyle(fontSize: 10, color: Colors.pinkAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
