import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  List<int> _numbers = [];
  @override
  void initState() {
    super.initState();
    // Start a timer that generates a new number every second
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // Add the new number to the list
      _numbers.add(Random().nextInt(100));
      // Tell the widget to rebuild with the updated list of numbers
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _numbers.length,
      itemBuilder: (context, index) {
        return Text('Number: ${_numbers[index]}');
      },
    );
  }
}


