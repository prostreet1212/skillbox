import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/repository/ConstPostRepository.dart';

import '../models/post.dart';



class DepartmentBloc extends Bloc<DepartmentEvent, Future<List<Post>>> {
  DepartmentBloc() : super(ConstPostRepository().getDepartments()) {
   /* on<GetDepartmentList>((event, emit) {
      emit(state);
      return state;
    });*/
  }
}

abstract class DepartmentEvent {}

class GetDepartmentList extends DepartmentEvent {}