import 'package:flutter/material.dart';


class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('aaa'),
          onPressed: (){
            Future.delayed(Duration(minutes: 100), () {
              print('object ${context.widget}');
            });
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}
