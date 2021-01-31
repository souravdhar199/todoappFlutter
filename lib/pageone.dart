import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

int _tasks = 0;
String names;

List<String> _pickedDate = [];

var _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

var _days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
int i = 1;
DateTime _selectedDate;

class pageone extends StatefulWidget {
  pageone(String s) {
    names = s;
  }

  @override
  _pageoneState createState() => _pageoneState();
}

List<Widget> allTheselectedDate = [];

class _pageoneState extends State<pageone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  CalendarController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: 95,
                width: 300,
                child: ListView(
                  children: <Widget>[
                    new Text(
                      'Hello $names!',
                      style: new TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: new Color(0xff395773),
                      ),
                    ),
                    _subtileforheading()
                  ],
                ),
              ),
            ],
          ),
          TableCalendar(
            calendarController: _controller,
            startingDayOfWeek: StartingDayOfWeek.monday,
            initialCalendarFormat: CalendarFormat.week,
            //This onday selected method will pick a date when we press the date
            onDaySelected: (DateTime day, List events, List holidays) {
              setState(() {
                _selectedDate = day;
              });
            },
          ),
          new Container(
            padding: EdgeInsets.all(5),
            height: 45,
            width: 400,
            child: new FlatButton(
              child: new Text(
                "Add Task",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  allTheselectedDate.add(_wrapEverythingup());
                });
              },
            ),
            decoration: BoxDecoration(
                color: new Color(0xff395773),
                borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(
            height: 20,
          ),
          _containaierbuilder(),
        ],
      ),
    );
  }

  Widget _containaierbuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: allTheselectedDate.length,
        itemBuilder: (BuildContext context, int index) {
          final Widget item =allTheselectedDate[index];
          return Dismissible(
              key: new ValueKey(item.toString()),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  allTheselectedDate.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('Well done')),
                );
              },
              child: allTheselectedDate[index]);
        });
  }
}

class _wrapEverythingup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: new Text(
              '  ${_days[_selectedDate.weekday - 1]} ${_selectedDate.day}, ${_months[_selectedDate.month - 1]}',
              style: new TextStyle(
                color: new Color(0xff395773),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          _addnoteButton(),
        ],
      ),
    );
  }
}

class _addnoteButton extends StatefulWidget {
  @override
  __addnoteButtonState createState() => __addnoteButtonState();
}

class __addnoteButtonState extends State<_addnoteButton> {
  List<Widget> _taskbox = [];

  _addTask() {
    _taskbox.add(_addtasksBox());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _showThealloptions(_taskbox),
          SizedBox(
            height: 30,
          ),
          new Container(
            height: 45,
            width: 400,
            child: FlatButton(
              child: Center(
                child: new Text(
                  'Add note',
                  style: new TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                _addTask();
              },
            ),
            decoration: BoxDecoration(
              color: new Color(0xff395773),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}

/*

 */
Widget _showThealloptions(var _taskbox) {
  return Container(
    height: 200,
    width: 400,
    decoration: BoxDecoration(
      border: Border.all(color: new Color(0xff395773)),
    ),
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _taskbox.length,
        itemBuilder: (BuildContext context, int index) {
          return _taskbox[index];
        }),
  );
}

/*
Allow user to type in the box in the container
 */
Widget _addtasksBox() {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    height: 45,
    width: 200,
    child: new TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.arrow_right), border: InputBorder.none),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: new Color(0xff395773))),
  );
}

Widget _subtileforheading() {
  if (_tasks == 0) {
    return Container(
      height: 20,
      width: 300,
      child: new Text(
        'Please tap the Add button to add tasks',
        style: new TextStyle(
          fontSize: 15,
          color: new Color(0xff395773),
        ),
      ),
    );
  } else {
    Container(
      height: 20,
      width: 300,
      child: new Text(
        'You have $_tasks tasks to do..',
        style: new TextStyle(
          fontSize: 15,
          color: new Color(0xff395773),
        ),
      ),
    );
  }
}
