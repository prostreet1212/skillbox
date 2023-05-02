import 'dart:async';

import 'package:flutter/material.dart';
import '../../models/post.dart';



class StaticWidget{
 static Widget getTextWidget(){
   return Column(
     mainAxisSize: MainAxisSize.min,
     children: [
       Text('утечка, ты где?')
     ],
   );
 }
}

var textStatic=StaticWidget.getTextWidget();



class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  Widget build(BuildContext context) {
    print(textStatic.toString());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: textStatic,
          onPressed: (){
              Post a=Post();
              Post b;
              b=a;
              a=b;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}



