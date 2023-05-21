import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/screens/widgets/load_image_panel.dart';
import 'package:homework_2/text_field_bloc/text_field_bloc.dart';


class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);

    List<Uint8List?> listImage = [];


  @override
  Widget build(BuildContext context) {
    var imageBloc = BlocProvider.of<ImageBloc>(context)
      ..add(LoadImageFromMemoryEvent());
    final textFieldBloc = BlocProvider.of<TextFieldBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            BlocConsumer<ImageBloc, ImageState>(
              // buildWhen:(prev,next)=>(prev as GetImageState).imageByteList!=(next as GetImageState).imageByteList,
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
                return Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          itemCount: listImage.length,
                          itemBuilder: (context, i) {
                            return Image.memory(listImage[i]!);
                          }),
                    ));

                /*FutureBuilder(
                    future: listImage,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.active:
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
                    });*/
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const LoadImagePanel(),

          ],
        ),
      ),
    );
  }
}
