import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/users.dart';

part  'db_state.dart';
part  'db_event.dart';




class DbBloc extends Bloc<DbEvent,DbState>{

  UserDatabase _userDatabase=UserDatabase();
  DbBloc(/*UserDatabase userDatabase*/)://_userDatabase=userDatabase,
        super(InitDb()){
    on<GetAllUsersEvent>(_onGetAllUsersEvent);
    on<InsertUserEvent>(_onInsertUserEvent);
  }


  _onGetAllUsersEvent(GetAllUsersEvent event, Emitter<DbState>emit)/*async*/{

    /*await _userDatabase.getAllUsers.then((value) {
       emit(AllUsersState().copyWith(users: value.toList()));
    });*/
     _userDatabase.usersStream.listen((event) {
       emit(AllUsersState().copyWith(users: event));
     });


  }


   _onInsertUserEvent(InsertUserEvent event, Emitter<DbState>emit)async{
     _userDatabase.insertUser(event.user);
     await _userDatabase.getAllUsers.then((value) {
       emit(AllUsersState().copyWith(users: value.toList()));
     });
   }

}