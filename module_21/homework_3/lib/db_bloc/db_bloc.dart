import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:homework_3/repository/users_helper.dart';
import '../repository/users.dart';

part  'db_state.dart';
part  'db_event.dart';




class DbBloc extends Bloc<DbEvent,DbState>{

   final UserDatabase _userDatabase/*=UserDatabase()*/;

   FlutterSecureStorage storage=const FlutterSecureStorage(
       aOptions: AndroidOptions(encryptedSharedPreferences: true),
       iOptions: IOSOptions(accessibility:KeychainAccessibility.first_unlock)
   );

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
    Map<String,String> map={};
    await emit.forEach(
        _userDatabase.usersStream,
        onData: (List<User> users){

        users.forEach((element) async {
          String key='${element.id}_${element.name}';
          String value=await storage.read(key: key)??'';
          map[key]=value;
        });
          return AllUsersState().copyWith(users: users,cardNumbers: map);
        });
  }

   _onInsertUserEvent(InsertUserEvent event, Emitter<DbState>emit)async{
     _userDatabase.insertUser(event.userHelper);
     /*int? i;
     await emit.forEach(
         _userDatabase.usersStream,
         onData: (List<User> users){
           i=AllUsersState().users[users.length-1].id;
           return AllUsersState();
         });
     print(i);*/
     User u=await _userDatabase.getLastRow();
     print(u.id);
     String key='${u.id}_${event.userHelper.name}';
    storage.write(key: key, value: event.userHelper.cardNumber.toString());
     AllUsersState();
   }

  _onDeleteUserEvent(DeleteUserEvent event, Emitter<DbState>emit){
    _userDatabase.deleteUser(event.index);
  }

  _onUpdateUserEvent(UpdateUserEvent event, Emitter<DbState>emit){

   _userDatabase.updateUser(event.userHelper,event.id);
  }

}