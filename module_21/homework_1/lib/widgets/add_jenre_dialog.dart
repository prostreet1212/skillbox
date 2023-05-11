import 'package:flutter/material.dart';


class AddJenreDialog extends StatelessWidget {
   AddJenreDialog({Key? key,required this.controller,required this.addJenre}) : super(key: key);

  TextEditingController? controller;
  Function (String) addJenre;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Добавить категорию музыки'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            //Text('This is a demo alert dialog.'),
            TextField(
              controller: controller,
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
            addJenre(controller!.text);
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
