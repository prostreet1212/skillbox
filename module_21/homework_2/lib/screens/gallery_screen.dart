import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_2/image_bloc/image_bloc.dart';
import 'package:homework_2/screens/widgets/load_image_panel.dart';
import 'package:homework_2/text_field_bloc/text_field_bloc.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageBloc = BlocProvider.of<ImageBloc>(context);
    final textFieldBloc = BlocProvider.of<TextFieldBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            BlocConsumer<ImageBloc, ImageState>(
              buildWhen: (prev, next) => next is GetImageState,
              listenWhen: (prev,next)=>next is ImageUrlNotValidState,
              listener: (context, state) {
                if (state is ImageUrlNotValidState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('url неверный'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Expanded(
                  flex: 10,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: (state is GetImageState)
                        ? ListView.builder(
                            itemCount: (state).imageByteList.length,
                            itemBuilder: (context, i) {
                              return Image.memory((state).imageByteList[i]!);
                            })
                        : Container(),
                  ),
                );
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
