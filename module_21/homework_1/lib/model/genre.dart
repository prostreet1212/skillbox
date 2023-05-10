import 'package:hive/hive.dart';

import 'artist.dart';

part 'genre.g.dart';

@HiveType(typeId: 0)
class Jenre extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<String>? artist;

  Jenre(this.name, this.artist);
}
