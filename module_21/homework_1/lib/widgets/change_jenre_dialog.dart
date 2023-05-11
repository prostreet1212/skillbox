import 'package:flutter/material.dart';

/*
class ChangeJenreDialog extends StatefulWidget {
  const ChangeJenreDialog({Key? key}) : super(key: key);

  @override
  State<ChangeJenreDialog> createState() => _ChangeJenreDialogState();
}

class _ChangeJenreDialogState extends State<ChangeJenreDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Изменить категорию музыки'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: widget.changeJenreController,
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
            widget.changeJenre(
                widget.i, widget.changeJenreController!.text);
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
*/