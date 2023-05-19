import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/screens/gallery_screen.dart';
import 'package:homework_2/text_field_bloc/text_field_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImageBloc()),
        BlocProvider(create: (context) => TextFieldBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  GalleryScreen(),
      ),
    );
  }
}
