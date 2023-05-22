part of 'image_bloc.dart';

abstract class ImageState {}

class GetImageState extends ImageState {
  List<Uint8List?> imageByteList;

  GetImageState({this.imageByteList = const []});

  GetImageState copyWith({List<Uint8List?>? imageByteList}) {
    return GetImageState(imageByteList: imageByteList ?? this.imageByteList);
  }
}

class ImageUrlNotValidState extends ImageState {}
