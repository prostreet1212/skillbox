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
  late Future<List<Uint8List?>> imageByteList=Future(() => []);
  List<Uint8List?> s=[];

  Future<List<Uint8List?>> _downloadImage() async {
    final appDir = await getApplicationDocumentsDirectory();
    var response = await Dio().get<List<int>>(
        urlTextController.text,
        options: Options(responseType: ResponseType.bytes));
    String nameImage=urlTextController.text.substring(urlTextController.text.lastIndexOf('/')+1,urlTextController.text.length);
    file = File('${appDir.path}/$nameImage');
    print(appDir.path);
    file.writeAsBytesSync(response.data ?? []);

    //if (await file.exists()) {
      imageBytes = file.readAsBytesSync();
      s.add(imageBytes);
      return s;
    //}

  }

  @override
  void initState() {
    super.initState();
    urlTextController = TextEditingController();
    urlTextController.text =
    'https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             //Expanded(child: ListView(),)
           FutureBuilder(
             future: imageByteList,
               builder: (context,snapshot){
               switch(snapshot.connectionState){
                 case ConnectionState.waiting:
                   return Center(child: CircularProgressIndicator(),);
                 case ConnectionState.active:
                   return Image.memory(snapshot.data![0]!);
                 case ConnectionState.done:
                   if(snapshot.hasData){
                     if(snapshot.data!.isNotEmpty){
                       var list=snapshot.data!;
                       return Expanded(child: ListView.builder(
                           itemCount: list.length,
                           itemBuilder: (context,i){
                             return Image.memory(list[i]!);
                           }));
                     }else{
                       return Container();
                     }
                   }else{
                     return Text('error');
                   }
                 default:
                   return Text('aaa');
               }

           }),


            SizedBox(height: 10,),
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
                      setState(() {
                        imageByteList=_downloadImage();
                      });

                    },)
                ],
              ),

          ],
        ),
      ),
    );
  }
}
