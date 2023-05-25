
part of 'db_bloc.dart';


abstract class DbEvent{}

class GetAllUsersEvent extends DbEvent{}


class InsertUserEvent extends DbEvent{
UserHelper userHelper;

 InsertUserEvent({required this.userHelper});
}

class DeleteUserEvent extends DbEvent{
 int index;

 DeleteUserEvent({required this.index});
}

class UpdateUserEvent extends DbEvent{
 UserHelper userHelper;
 int id;

 UpdateUserEvent({required this.userHelper,required this.id});
}