
part of 'db_bloc.dart';

abstract class DbState{}

class AllUsersState extends DbState{
   List<User> users;

  AllUsersState({this.users = const []});

  AllUsersState copyWith({required List<User>? users}){
    return AllUsersState( users:users??this.users);
  }
}

class InitDb extends DbState{}