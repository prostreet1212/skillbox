import 'package:flutter/material.dart';
import 'package:homework_1/model/genre.dart';
import 'package:homework_1/screens/description_screen.dart';
import 'package:uuid/uuid.dart';

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
    changeArtistController=TextEditingController();
    changeDescriptionController=TextEditingController();
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
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionScreen(description: widget.jenreBoxItem.artist!.elementAt(i))));
                },
                onLongPress: (){
                  changeArtistController!.text=widget.jenreBoxItem.artist!.elementAt(i).substring(0,widget.jenreBoxItem.artist!.elementAt(i).indexOf('\n'));
                  changeDescriptionController!.text=widget.jenreBoxItem.artist!.elementAt(i).substring(widget.jenreBoxItem.artist!.elementAt(i).indexOf('\n')+1,widget.jenreBoxItem.artist!.elementAt(i).length);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title:
                          const Text('Изменить артиста'),
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
                                const SizedBox(height: 8,),
                                TextField(
                                  controller:changeDescriptionController,
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
                                widget.jenreBoxItem.artist![i]='${changeArtistController!.text}\n${changeDescriptionController!.text}';
                                widget.jenreBoxItem.save();
                                setState(() {});
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
                child: Dismissible(
                  key: Key(const Uuid().v1()),
                  onDismissed: (direction){
                    setState(() {
                      widget.jenreBoxItem.artist!.removeAt(i);
                      widget.jenreBoxItem.save();
                    });
                  },
                  child: Card(
                    color: Colors.tealAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          widget.jenreBoxItem.artist![i].substring(0,widget.jenreBoxItem.artist![i].indexOf('\n')),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              );
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
                return AlertDialog(
                  title:
                  const Text('Добавить артиста'),
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
                        const SizedBox(height: 8,),
                        TextField(
                            controller:changeDescriptionController,
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
                        //widget.jenreBoxItem.artist!.add(changeArtistController!.text);
                        widget.jenreBoxItem.artist!.add('${changeArtistController!.text}\n${changeDescriptionController!.text}');
                        widget.jenreBoxItem.save();
                        setState(() {});
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
      ),
    );
  }
}
