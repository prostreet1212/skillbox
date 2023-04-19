import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/blocs/department_bloc.dart';
import 'package:homework_1/blocs/post_bloc.dart';
import 'package:homework_1/ui/screens/kdrc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PostBloc>(create: (_) => PostBloc()),
          BlocProvider<DepartmentBloc>(create: (_) => DepartmentBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const KdrcScreen(),
        ),
    );
  }
}
