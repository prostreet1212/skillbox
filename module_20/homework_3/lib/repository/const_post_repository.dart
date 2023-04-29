import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:homework_1/models/post.dart';
import '../utils/utils.dart';
import 'post_repository.dart';


class ConstPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts() async {
  try{
    List<Post> postList = [];
    var response=await Dio().get('http://kdrc.ru/wp-json/wp/v2/posts/?per_page=100');
    //var response=await Dio().get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
    var data=response.data;
    postList=data.map<Post>((post){
      return Post.fromJson(post);
    }).toList();
    return postList;
  } on DioError catch(e){
    throw e.response!.statusCode.toString();
  }
  }

  @override
  Future<List<Post>> getDepartments() async {
    try{
      List<Post> postList = [];
      var response=await Dio().get('http://kdrc.ru/wp-json/wp/v2/posts/?categories=3');
      //var response=await Dio().get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var data=response.data;
      postList=data.map<Post>((post){
        return Post.fromJson(post);
      }).toList();
      return postList;
    } on DioError catch(e){
      throw e.response!.statusCode.toString();
    }
  }
}
