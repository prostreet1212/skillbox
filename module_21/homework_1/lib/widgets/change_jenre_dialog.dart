import 'package:flutter/material.dart';

class ChangeJenreDialog extends StatelessWidget {
  const ChangeJenreDialog(
      {Key? key,
      required this.changeJenreController,
      required this.changeJenre,
      required this.i})
      : super(key: key);

  final TextEditingController? changeJenreController;
  final Function(int, String) changeJenre;
  final int i;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Изменить категорию музыки'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: changeJenreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Жанр',
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ОК'),
          onPressed: () {
            changeJenre(i, changeJenreController!.text);
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
