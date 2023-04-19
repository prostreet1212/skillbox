import 'dart:convert';
import 'package:homework_1/models/post.dart';
import '../utils/utils.dart';
import 'post_repository.dart';

class ConstPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts() async {
    List<Post> postList = [];
    String result = await fetchFileFromAssets('assets/posts.json');
    List<dynamic> postsDynamic = jsonDecode(result);
    postList = postsDynamic.map((e) => Post.fromJson(e)).toList();
    return postList;
  }

  @override
  Future<List<Post>> getDepartments() async {
    List<Post> departmentList = [];
    String result = await fetchFileFromAssets('assets/departments.json');
    List<dynamic> departmentsDynamic = jsonDecode(result);
    departmentList = departmentsDynamic.map((e) => Post.fromJson(e)).toList();
    return departmentList;
  }

//http://kdrc.ru/wp-json/wp/v2/posts/?categories=3
}
