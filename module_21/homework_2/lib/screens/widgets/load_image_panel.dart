import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';

class LoadImagePanel extends StatelessWidget {
  const LoadImagePanel({Key? key, required this.urlTextController})
      : super(key: key);
  final TextEditingController urlTextController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: urlTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Введите url картинки',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  BlocProvider.of<ImageBloc>(context)
                      .add(LoadImageFromUrlEvent(urlTextController.text));
                },
              )
            ],
          ),
        ));
  }
}
