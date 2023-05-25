import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/repository/users_helper.dart';
import '../repository/users.dart';

part  'db_state.dart';
part  'db_event.dart';




class DbBloc extends Bloc<DbEvent,DbState>{

   final UserDatabase _userDatabase/*=UserDatabase()*/;

  DbBloc(UserDatabase userDatabase):_userDatabase=userDatabase,
        super(InitDb()){
    on<GetAllUsersEvent>(_onGetAllUsersEvent);
    on<InsertUserEvent>(_onInsertUserEvent);
    on<DeleteUserEvent>(_onDeleteUserEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
  }


  _onGetAllUsersEvent(GetAllUsersEvent event, Emitter<DbState>emit)/*async*/async{

//рабочий код для future списка юзеров
   /* await _userDatabase.getAllUsers.then((value) {
       emit(AllUsersState().copyWith(users: value.toList()));
    });*/

    await emit.forEach(
        _userDatabase.usersStream,
        onData: (List<User> users){
          return AllUsersState().copyWith(users: users);
        });
  }

   _onInsertUserEvent(InsertUserEvent event, Emitter<DbState>emit){
     _userDatabase.insertUser(event.userHelper);
   }

  _onDeleteUserEvent(DeleteUserEvent event, Emitter<DbState>emit){
    _userDatabase.deleteUser(event.index);
  }

  _onUpdateUserEvent(UpdateUserEvent event, Emitter<DbState>emit){
   _userDatabase.updateUser(event.userHelper,event.id);
  }

}