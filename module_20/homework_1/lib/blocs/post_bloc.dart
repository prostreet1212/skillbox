import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/repository/ConstPostRepository.dart';

import '../models/post.dart';

class PostBloc extends Bloc<PostEvent, Future<List<Post>>> {
  PostBloc() : super(ConstPostRepository().getPosts()) {
    on<GetPostList>((event, emit) {
      emit(state);
      return state;
    });
  }
}

abstract class PostEvent {}

class GetPostList extends PostEvent {}
