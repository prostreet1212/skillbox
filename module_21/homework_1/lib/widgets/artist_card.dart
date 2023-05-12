import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../screens/description_screen.dart';
import 'change_artist_dialog.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard(
      {Key? key,
      required this.changeArtistController,
      required this.changeDescriptionController,
      required this.jenreItem,
      required this.i,
      required this.changeArtist})
      : super(key: key);

  final TextEditingController? changeArtistController;
  final TextEditingController? changeDescriptionController;
  final String jenreItem;
  final int i;
  final Function(String, String, int) changeArtist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DescriptionScreen(description: jenreItem)));
      },
      onLongPress: () {
        changeArtistController!.text =
            jenreItem.substring(0, jenreItem.indexOf('\n'));
        changeDescriptionController!.text =
            jenreItem.substring(jenreItem.indexOf('\n') + 1, jenreItem.length);
        showDialog(
            context: context,
            builder: (context) {
              return ChangeArtistDialog(
                  changeArtistController: changeArtistController,
                  changeDescriptionController: changeDescriptionController,
                  i: i,
                  changeArtist: changeArtist);
            });
      },
      child: Dismissible(
        key: Key(const Uuid().v1()),
        onDismissed: (direction) {
          /*setState(() {
            widget.jenreBoxItem.artist!.removeAt(i);
            widget.jenreBoxItem.save();
          });*/
        },
        child: Card(
          color: Colors.tealAccent,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                jenreItem.substring(0, jenreItem.indexOf('\n')),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
