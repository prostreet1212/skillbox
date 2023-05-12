import 'package:flutter/material.dart';

class ChangeArtistDialog extends StatelessWidget {
  const ChangeArtistDialog(
      {Key? key,
      required this.changeArtistController,
      required this.changeDescriptionController,
      required this.i,
      required this.changeArtist})
      : super(key: key);

  final TextEditingController? changeArtistController;
  final TextEditingController? changeDescriptionController;
  final int i;
  final Function(String, String, int) changeArtist;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Изменить артиста'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            //Text('This is a demo alert dialog.'),
            TextField(
              controller: changeArtistController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Артист',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: changeDescriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Описание',
              ),
              maxLines: 3,
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('ОК'),
          onPressed: () {
            changeArtist(changeArtistController!.text,
                changeDescriptionController!.text, i);
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
