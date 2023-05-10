import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/genre.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initHive();
  }

  void initHive() async {
    Hive.init('path');
    Hive.registerAdapter(JenreAdapter());
    Hive.openBox('jenre').then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify'),
      ),
      body: Container(),
    );
  }
}
