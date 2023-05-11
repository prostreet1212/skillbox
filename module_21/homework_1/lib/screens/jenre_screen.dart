import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:homework_1/widgets/add_jenre_dialog.dart';
import 'package:homework_1/widgets/jenre_card.dart';
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

  @override
  void dispose() {
    addJenreController!.dispose();
    changeJenreController!.dispose();
    super.dispose();
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
                      return JenreCard(
                          changeJenreController: changeJenreController,
                          jenre: jenreBox!.values.elementAt(i),
                          box: box,
                          changeJenre: changeJenre,
                          i: i);
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
                return AddJenreDialog(
                    controller: addJenreController, addJenre: addJenre);
              });
        },
      ),
    );
  }
}
