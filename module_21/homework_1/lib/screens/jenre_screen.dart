import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:homework_1/screens/artist_screen.dart';
import '../model/genre.dart';

class JenreScreen extends StatefulWidget {
  const JenreScreen({Key? key}) : super(key: key);

  @override
  State<JenreScreen> createState() => _JenreScreenState();
}

class _JenreScreenState extends State<JenreScreen> {
  Box<Jenre>? jenreBox;
  TextEditingController? addJenreController;
  TextEditingController? changeJenreController;

  @override
  void initState() {
    super.initState();
    addJenreController = TextEditingController(text: '');
    changeJenreController = TextEditingController(text: '');
    initHive();
  }

  void initHive() async {
    Hive.openBox<Jenre>('jenre').then((value) {
      setState(() {
        jenreBox = value;
      });
    });
  }

  void addJenre(String name) async {
    jenreBox!.add(Jenre(name, []));
  }

  void changeJenre(int index, String changedJenre) {
    jenreBox!.values.elementAt(index).name = changedJenre;
    jenreBox!.values.elementAt(index).save();
    jenreBox!.values.elementAt(index).artist!.add('aa');
  }

  void removeJenre(int index) {
    jenreBox!.values.elementAt(index).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify на минималках'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: jenreBox == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ValueListenableBuilder(
                valueListenable: jenreBox!.listenable(),
                builder: (context, Box<Jenre> box, widget) {
                  return ListView.separated(
                    itemCount: box.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onLongPress: () {
                          changeJenreController!.text =
                              jenreBox!.values.elementAt(i).name;
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      const Text('Изменить категорию музыки'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        //Text('This is a demo alert dialog.'),
                                        TextField(
                                          controller: changeJenreController,
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
                                        changeJenre(
                                            i, changeJenreController!.text);
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
                              builder: (context) => ArtistScreen(jenreBoxItem: jenreBox!.values.elementAt(i),),
                            ),
                          );
                        },
                        child: Dismissible(
                            key: Key(box.values.elementAt(i).name),
                            onDismissed: (direction) {
                              setState(() {
                                //items.removeAt(i);
                                box.values.elementAt(i).delete();
                              });
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
                    },
                    separatorBuilder: (context, i) {
                      return Container(height: 0);
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Добавить категорию музыки'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        //Text('This is a demo alert dialog.'),
                        TextField(
                          controller: addJenreController,
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
                        addJenre(addJenreController!.text);
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
          //removeJenre();
        },
      ),
    );
  }
}
