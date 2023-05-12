import 'package:flutter/material.dart';
import 'package:homework_1/model/genre.dart';
import 'package:homework_1/widgets/add_artist_dialog.dart';
import 'package:homework_1/widgets/artist_card.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({Key? key, required this.jenreBoxItem}) : super(key: key);

  final Jenre jenreBoxItem;

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  TextEditingController? changeArtistController;
  TextEditingController? changeDescriptionController;

  @override
  void initState() {
    super.initState();
    changeArtistController = TextEditingController();
    changeDescriptionController = TextEditingController();
  }

  void changeArtist(String artist, String description, int i) {
    widget.jenreBoxItem.artist![i] = '$artist\n$description';
    widget.jenreBoxItem.save();
    setState(() {});
  }

  void addArtist(String artist, String description) {
    widget.jenreBoxItem.artist!.add('$artist\n$description');
    widget.jenreBoxItem.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Артисты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: widget.jenreBoxItem.artist!.length,
            itemBuilder: (context, i) {
              return ArtistCard(changeArtistController: changeArtistController,
                  changeDescriptionController: changeDescriptionController,
                  jenreItem: widget.jenreBoxItem.artist!.elementAt(i),
                  i: i,
                  changeArtist: changeArtist);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddArtistDialog(
                    changeArtistController: changeArtistController,
                    changeDescriptionController: changeDescriptionController,
                    addArtist: addArtist);
              });
        },
      ),
    );
  }
}
