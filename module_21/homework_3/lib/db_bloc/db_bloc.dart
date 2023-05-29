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
    on<GetAllUsersEvent>(_getAllUsersEvent);
    on<InsertUserEvent>(_insertUserEvent);
    on<DeleteUserEvent>(_deleteUserEvent);
    on<UpdateUserEvent>(_updateUserEvent);
  }

   Map<String,String> cardMap={};
  _getAllUsersEvent(GetAllUsersEvent event, Emitter<DbState>emit)/*async*/async{

//рабочий код для future списка юзеров
   /* await _userDatabase.getAllUsers.then((value) {
       emit(AllUsersState().copyWith(users: value.toList()));
    });*/


    await storage.readAll().then((value)async {
      cardMap=value;
    });

    await emit.forEach (
        _userDatabase.usersStream,
        onData: (List<User> users)  {
          return AllUsersState().copyWith(users: users,cardNumbers: cardMap);
        });





  }

   _insertUserEvent(InsertUserEvent event, Emitter<DbState>emit)async{
     _userDatabase.insertUser(event.userHelper);

     User u=await _userDatabase.getLastRow();
     print(u.id);
     String key='${u.id}_${event.userHelper.name}';
     storage.write(key: key, value: event.userHelper.cardNumber.toString());
    print('write');
     await storage.readAll().then((value) {
       emit(AllUsersState().copyWith(users:(state as AllUsersState).users,cardNumbers: value));
     });
     
   }




  _deleteUserEvent(DeleteUserEvent event, Emitter<DbState>emit){
    _userDatabase.deleteUser(event.index);
  }

  _updateUserEvent(UpdateUserEvent event, Emitter<DbState>emit){
   _userDatabase.updateUser(event.userHelper,event.id);
  }

}