import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/genre.dart';
import '../screens/artist_screen.dart';

class JenreCard extends StatefulWidget {
  JenreCard(
      {Key? key,
      required this.changeJenreController,
      required this.jenre,
      required this.box,
      required this.changeJenre,
      required this.i})
      : super(key: key);

  TextEditingController? changeJenreController;
  Jenre jenre;
  Box<Jenre> box;
  Function(int, String) changeJenre;
  int i;

  @override
  State<JenreCard> createState() => _JenreCardState();
}

class _JenreCardState extends State<JenreCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        widget.changeJenreController!.text = widget.jenre.name;
        showDialog(
            context: context,
            builder: (context) {
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
            });
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistScreen(
              jenreBoxItem: widget.jenre,
            ),
          ),
        );
      },
      child: Dismissible(
          key: Key(widget.box.values.elementAt(widget.i).name),
          onDismissed: (direction) {
           // setState(() {
              widget.box.values.elementAt(widget.i).delete();
          //  });
          },
          child: Card(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  widget.box.values.elementAt(widget.i).name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          )),
    );
  }
}
