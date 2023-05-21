import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/text_field_bloc/text_field_bloc.dart';
/*
class LoadImagePanel extends StatelessWidget {
   LoadImagePanel({Key? key}) : super(key: key);
  TextEditingController _controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: BlocBuilder<TextFieldBloc, TextFieldState>(
                    builder: (context, state) {
                      return TextField(

                        controller: TextEditingController(text: state.text),

                        onChanged: (newValue) {
                          BlocProvider.of<TextFieldBloc>(context)
                              .add(TextFieldEvent(newValue));
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Введите url картинки',
                        ),
                      );
                    },
                  )),
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  BlocProvider.of<ImageBloc>(context).add(LoadImageFromUrlEvent(
                      BlocProvider.of<TextFieldBloc>(context).state.text));
                },
              )
            ],
          ),
        );
  }
}
*/


class LoadImagePanel extends StatefulWidget {
  const LoadImagePanel({Key? key}) : super(key: key);

  @override
  State<LoadImagePanel> createState() => _LoadImagePanelState();
}

class _LoadImagePanelState extends State<LoadImagePanel> {
 late TextEditingController controller;
  @override
  void initState() {
    super.initState();
   controller=TextEditingController(text: BlocProvider.of<TextFieldBloc>(context).state.text);
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: BlocBuilder<TextFieldBloc, TextFieldState>(
                builder: (context, state) {
                 // controller.text=state.text;
                  return TextField(

                    controller:controller,
                    onChanged: (newValue) {
                      BlocProvider.of<TextFieldBloc>(context)
                          .add(TextFieldEvent(newValue));
                      //String g=BlocProvider.of<TextFieldBloc>(context).state.text;

                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите url картинки',
                    ),
                  );
                },
              )),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              BlocProvider.of<ImageBloc>(context).add(LoadImageFromUrlEvent(
                  BlocProvider.of<TextFieldBloc>(context).state.text));
            },
          )
        ],
      ),
    );
  }
}
