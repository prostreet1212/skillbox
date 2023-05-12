import 'package:flutter/material.dart';

class AddArtistDialog extends StatelessWidget {
  const AddArtistDialog({
    Key? key,
    required this.changeArtistController,
    required this.changeDescriptionController,
    required this.addArtist,
  }) : super(key: key);

  final TextEditingController? changeArtistController;
  final TextEditingController? changeDescriptionController;
  final Function(String, String) addArtist;

  @override
  Widget build(BuildContext context) {
    changeArtistController!.text = '';
    changeDescriptionController!.text = '';
    return AlertDialog(
      title: const Text('Добавить артиста'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
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
            addArtist(changeArtistController!.text,
                changeDescriptionController!.text);
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
