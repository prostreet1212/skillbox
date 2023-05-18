

part of 'image_bloc.dart';

abstract class ImageEvent{}

class LoadImageFromMemoryEvent extends ImageEvent{
}

class LoadImageFromUrlEvent extends ImageEvent{
  String url;

  LoadImageFromUrlEvent(this.url);
}

