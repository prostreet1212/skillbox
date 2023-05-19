part of 'image_bloc.dart';

abstract class ImageState {}

class GetImageState extends ImageState {
  final Future<List<Uint8List?>> imageByteList;

  GetImageState({required this.imageByteList });

  GetImageState copyWith({Future<List<Uint8List?>>? imageByteList}) {
    return GetImageState(imageByteList: imageByteList ?? this.imageByteList);
  }
}

class ImageUrlNotValidState extends ImageState {}
