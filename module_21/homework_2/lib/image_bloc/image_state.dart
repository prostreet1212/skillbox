part of 'image_bloc.dart';

class ImageState {
   final Future<List<Uint8List?>> imageByteList;


   ImageState (  this.imageByteList);

   /*ImageState.copyWith(this.imageByteList, Future<List<Uint8List?>>? imageByteList){
      return ImageState(imageByteList: imageByteList??this.imageByteList);*/
}

