import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1/repository/const_post_repository.dart';

import '../models/post.dart';



class DepartmentBloc extends Bloc<DepartmentEvent, Future<List<Post>>> {
  DepartmentBloc() : super(ConstPostRepository().getDepartments());

}

abstract class DepartmentEvent {}
class GetDepartmentList extends DepartmentEvent {}