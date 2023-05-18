import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/screens/widgets/load_image_panel.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late TextEditingController urlTextController;
  late ImageBloc imageBloc;
  Future<List<Uint8List?>> listImage = Future.value([]);

  @override
  void initState() {
    super.initState();
    urlTextController = TextEditingController();
    urlTextController.text =
        'https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg';
    imageBloc = BlocProvider.of<ImageBloc>(context);
    imageBloc.add(LoadImageFromMemoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            BlocConsumer<ImageBloc, ImageState>(
              listener: (context, state) {
                if (state is ImageUrlNotValidState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('url неверный'),
                    ),
                  );
                }
                if (state is GetImageState) {
                  listImage = state.imageByteList;
                }
              },
              builder: (context, state) {
                return FutureBuilder(
                    future: listImage,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Expanded(
                              flex: 10,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ));
                        case ConnectionState.active:
                          return Image.memory(snapshot.data![0]!);
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            if (snapshot.data!.isNotEmpty) {
                              var list = snapshot.data!;
                              return Expanded(
                                  flex: 10,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (context, i) {
                                          return Image.memory(list[i]!);
                                        }),
                                  ));
                            } else {
                              return Container();
                            }
                          } else {
                            return const Text('error');
                          }
                        default:
                          return const Text('not working');
                      }
                    });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LoadImagePanel(urlTextController: urlTextController),
          ],
        ),
      ),
    );
  }
}
