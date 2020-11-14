import 'package:flutter/material.dart';
import 'package:v2workshop/models/Todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  const TodoCard({Key key, this.todo}) : super(key: key);

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.todo.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: widget.todo.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.todo.time,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 11)),
                      )
                    ],
                  ),
                  Chip(
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: widget.todo.color,
                        fontWeight: FontWeight.bold),
                    label: Text('Complete ${widget.todo.percentage}%'),
                    backgroundColor: Color(0xFFDCDBE6),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset('assets/${widget.todo.image}',
                    fit: BoxFit.fitWidth),
              ),
            )
          ],
        ),
      )),
    );
  }
}
