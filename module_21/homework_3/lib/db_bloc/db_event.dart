
part of 'db_bloc.dart';


abstract class DbEvent{}

class GetAllUsersEvent extends DbEvent{}

class InsertUserEvent extends DbEvent{
  User user;

  InsertUserEvent({required this.user});
}