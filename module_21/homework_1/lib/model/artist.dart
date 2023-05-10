import 'package:hive/hive.dart';

part 'artist.g.dart';

@HiveType(typeId: 1)
class Artist extends HiveObject{

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  Artist(this.title,this.description);
}