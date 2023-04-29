import 'package:flutter/material.dart';
import 'package:homework_1/ui/screens/test_screen.dart';
import 'package:homework_1/ui/widgets/department_tab.dart';
import 'package:homework_1/ui/widgets/post_tab.dart';

class KdrcScreen extends StatelessWidget {
  const KdrcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kdrc2'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Все записи',
            ),
            Tab(
              text: 'Отделения организации',
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            PostTab(),
            DepartmentTab(),
          ],
        ),
        floatingActionButton:  FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context){return TestScreen();}));
          },
        ),
      ),
    );
  }
}
