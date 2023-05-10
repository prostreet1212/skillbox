import 'package:flutter/material.dart';
import 'package:homework_1/model/genre.dart';

class ArtistScreen extends StatefulWidget {
  ArtistScreen({Key? key, required this.jenreBoxItem}) : super(key: key);

  Jenre jenreBoxItem;

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: widget.jenreBoxItem.artist!.length,
            itemBuilder: (context, i) {
              return Card(
                color: Colors.tealAccent,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      widget.jenreBoxItem.artist![i],
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        child: Icon(
          Icons.add,
          color: Colors.indigo,
        ),
        onPressed: () {
          widget.jenreBoxItem.artist!.add('value1');
          widget.jenreBoxItem.save();
          setState(() {});
        },
      ),
    );
  }
}
