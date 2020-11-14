import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateTask extends StatefulWidget {
  final TabController tabC;
  const CreateTask({
    Key key,
    this.tabC,
  }) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  Icon _icon;
  List<String> contributores = ['hedi', 'bill', 'elon', 'mark'];
  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2)),
      contentPadding: EdgeInsets.all(20.0),
      labelText: "Task Title",
      hintText: "Title here",
      labelStyle: TextStyle(
          color: Color(0xFF345C7D), fontSize: 20, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Create New Task'),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/Path 428.svg'),
          onPressed: () {
            widget.tabC.animateTo(0);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(decoration: decoration),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 6,
                      decoration: decoration.copyWith(
                          labelText: "Description",
                          hintText: "write your description here..."),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.all(10),
                    childAspectRatio: 2,
                    children: [
                      Card(
                        child: TextButton.icon(
                            onPressed: () async {
                              IconData icon =
                                  await FlutterIconPicker.showIconPicker(
                                      context,
                                      iconPackMode: IconPack.cupertino);

                              _icon = Icon(icon);
                              setState(() {});

                              debugPrint('Picked Icon:  $icon');
                            },
                            icon: Icon(Icons.import_contacts,
                                color: currentColor),
                            label: Text("Icon",
                                style: TextStyle(color: currentColor))),
                      ),
                      Card(
                        child: TextButton.icon(
                            onPressed: () async {
                              Color pickedColor = await showDialog<Color>(
                                context: context,
                                child: AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: MaterialPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: (c) {
                                        setState(() {
                                          pickerColor = c;
                                        });
                                      },
                                      // only on portrait mode
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: const Text('Got it'),
                                      onPressed: () {
                                        setState(
                                            () => currentColor = pickerColor);
                                        Navigator.of(context).pop(pickerColor);
                                      },
                                    ),
                                  ],
                                ),
                              );
                              print(pickedColor);
                            },
                            icon: Icon(Icons.style, color: currentColor),
                            label: Text("Color",
                                style: TextStyle(color: currentColor))),
                      ),
                      Card(
                        child: TextButton.icon(
                            onPressed: () async {
                              DateTime pickedTime = await showDatePicker(
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2025),
                                  context: context,
                                  initialDate: DateTime.now());
                              print(pickedTime);
                            },
                            icon: Icon(Icons.date_range, color: currentColor),
                            label: Text("Date",
                                style: TextStyle(color: currentColor))),
                      ),
                      Card(
                        child: TextButton.icon(
                            onPressed: () async {
                              TimeOfDay pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              print(pickedTime.format(context));
                            },
                            icon:
                                Icon(Icons.time_to_leave, color: currentColor),
                            label: Text("Time",
                                style: TextStyle(color: currentColor))),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Chose Contributor",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xFF345C7D),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemExtent: 50,
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              'assets/${contributores[index % contributores.length]}.jpg'),
                        );
                      }),
                )),
                Flexible(
                  flex: 1,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    onPressed: () {},
                    child: Text("Create Task ",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    color: currentColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
