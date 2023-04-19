import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/repository/const_post_repository.dart';
import '../models/post.dart';

class PostBloc extends Bloc<PostEvent, Future<List<Post>>> {
  PostBloc() : super(ConstPostRepository().getPosts());
}

abstract class PostEvent {}
class GetPostList extends PostEvent {}




