
part of 'db_bloc.dart';

abstract class DbState{}


class AllUsersState extends DbState{
   final List<User> users;
   final Map<String,String> cardNumbers;

  AllUsersState({this.users = const [],this.cardNumbers=const {}});

  AllUsersState copyWith({ List<User>? users,  Map<String,String>? cardNumbers}){
    return AllUsersState( users:users??this.users,
        cardNumbers: cardNumbers??this.cardNumbers);
  }



}

class InitDb extends DbState{

}