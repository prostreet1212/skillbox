part of 'image_bloc.dart';

abstract class ImageState {

}

class GetImageState extends ImageState{
   final Future<List<Uint8List?>> imageByteList;


   GetImageState (  this.imageByteList);

/*ImageState.copyWith(this.imageByteList, Future<List<Uint8List?>>? imageByteList){
      return ImageState(imageByteList: imageByteList??this.imageByteList);*/
}

class ImageUrlNotValidState extends ImageState{}

