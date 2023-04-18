

import '../models/post.dart';

abstract class PostRepository{


  PostRepository();

  Future<List<Post>> getPosts();
  Future<List<Post>> getDepartments();
}