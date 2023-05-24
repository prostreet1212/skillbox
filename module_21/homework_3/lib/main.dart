import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/db_bloc/db_bloc.dart';
import 'package:homework_3/repository/users.dart';
import 'package:homework_3/screens/db_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DbBloc(/*UserDatabase()*/)..add(GetAllUsersEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DbScreen(),
      ),);
  }
}


