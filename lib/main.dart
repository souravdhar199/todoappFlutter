import 'package:flutter/material.dart';
import 'package:todoappflutter/pageone.dart';

TextEditingController getthename = new TextEditingController();//Get the data from the textfield
String name;
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  String _name;
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              _dashbored(),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: new Color(0xff395773),
                    borderRadius: BorderRadius.circular(30)),
                child: FlatButton(
                  child: new Text(
                    'Lets get started',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      name=getthename.text;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pageone('$name'),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}

Widget _dashbored() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
          height: 200,
          width: 500,
          child: Image.asset('assets/tile2.jpg.png'),
          decoration: BoxDecoration(color: Colors.white),
        ),
        Container(
          height: 100,
          width: 500,
          child: ListView(
            children: <Widget>[
              Text(
                '   Welcome!',
                style: new TextStyle(
                    fontSize: 30,
                    color: new Color(0xff395773),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '       Lets get the work done',
                style:
                new TextStyle(fontSize: 15, color: new Color(0xff395773)),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'What is your name?',
          style: new TextStyle(
            color: new Color(0xff395773),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          width: 300,
          child: TextFormField(
            controller: getthename,
            style: new TextStyle(color: Colors.white, fontSize: 17),
            decoration: InputDecoration(border: InputBorder.none),
          ),
          decoration: BoxDecoration(
              color: new Color(0xff395773),
              borderRadius: BorderRadius.circular(30)),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    ),
  );
}
