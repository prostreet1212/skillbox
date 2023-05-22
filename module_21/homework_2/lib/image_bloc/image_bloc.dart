import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(GetImageState(imageByteList: [])) {
    on<LoadImageFromMemoryEvent>(_onLoadImageFromMemory);
    on<LoadImageFromUrlEvent>(_onLoadImageFromUrl);
  }

  List<Uint8List?> s = [];

  _onLoadImageFromMemory(
      LoadImageFromMemoryEvent event, Emitter<ImageState> emit) async {
    final appDir = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> r = Directory(appDir.path).listSync();
    r.map((e) {
      if (e.path.contains('.jpg') ||
          e.path.contains('.jpeg') ||
          e.path.contains('.png')) {
        File file = File(e.path);
        Uint8List? imageBytes = file.readAsBytesSync();
        s.add(imageBytes);
      }
    }).toList();

    emit(GetImageState(imageByteList: s));
    return s;
  }

  _onLoadImageFromUrl(

      LoadImageFromUrlEvent event, Emitter<ImageState> emit) async {
    Uint8List? imageBytes;
    if (Uri.parse(event.url).isAbsolute) {
      final appDir = await getApplicationDocumentsDirectory();
      var response = await Dio().get<List<int>>(event.url,
          options: Options(responseType: ResponseType.bytes));
      String nameImage =
          event.url.substring(event.url.lastIndexOf('/') + 1, event.url.length);
      File file = File('${appDir.path}/$nameImage');
      file.writeAsBytesSync(response.data ?? []);

      if (await file.exists()) {
        imageBytes = file.readAsBytesSync();
        s.add(imageBytes);
      }
        emit(GetImageState().copyWith(imageByteList: s));
      //emit((state as GetImageState).copyWith(imageByteList: s));
    } else {
      emit(ImageUrlNotValidState());
    }
  }
}
