import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/text_field_bloc/text_field_bloc.dart';

class LoadImagePanel extends StatelessWidget {
  const LoadImagePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldBloc = BlocProvider.of<TextFieldBloc>(context);
    final imageBloc = BlocProvider.of<ImageBloc>(context);
    textFieldBloc.controller.text = textFieldBloc.state.text;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: BlocBuilder<TextFieldBloc, TextFieldState>(
              builder: (context, state) {
                return TextField(
                  controller: textFieldBloc.controller,
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
            ),
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              imageBloc.add(LoadImageFromUrlEvent(textFieldBloc.state.text));
            },
          )
        ],
      ),
    );
  }
}
