import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late TextEditingController urlTextController;
  late File file;
  Uint8List? imageBytes;

  void _init() async {
    final appDir = await getApplicationDocumentsDirectory();
    var response = await Dio().get<List<int>>(
        urlTextController.text,
        options: Options(responseType: ResponseType.bytes));
    file = File('${appDir.path}/korn.jpg');
    file.writeAsBytesSync(response.data ?? []);
    if (await file.exists()) {

      imageBytes = file.readAsBytesSync();
    }

  }

  @override
  void initState() {
    super.initState();
    urlTextController = TextEditingController();
    urlTextController.text =
    'https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg';
    String a='https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg';
    String b=a.substring(a.lastIndexOf('/')+1,a.length);
    print(b);
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
             //Expanded(child: ListView(),)
           // imageBytes!=null?
            Image.memory(imageBytes!),//:
            //Text('not load image'),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: urlTextController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите url картинки',
                    ),
                  ),),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {

                  },)
              ],
            )
          ],
        ),
      ),
    );
  }
}
