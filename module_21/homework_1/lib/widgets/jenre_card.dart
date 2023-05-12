import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homework_1/widgets/change_jenre_dialog.dart';
import '../model/genre.dart';
import '../screens/artist_screen.dart';

class JenreCard extends StatelessWidget {
  const JenreCard(
      {Key? key,
      required this.changeJenreController,
      required this.jenre,
      required this.box,
      required this.changeJenre,
      required this.i})
      : super(key: key);

  final TextEditingController? changeJenreController;
  final Jenre jenre;
  final Box<Jenre> box;
  final Function(int, String) changeJenre;
  final int i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        changeJenreController!.text = jenre.name;
        showDialog(
            context: context,
            builder: (context) {
              return ChangeJenreDialog(
                  changeJenreController: changeJenreController,
                  changeJenre: changeJenre,
                  i: i);
            });
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtistScreen(
              jenreBoxItem: jenre,
            ),
          ),
        );
      },
      child: Dismissible(
          key: Key(box.values.elementAt(i).name),
          onDismissed: (direction) {
            box.values.elementAt(i).delete();
          },
          child: Card(
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  box.values.elementAt(i).name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          )),
    );
  }
}
