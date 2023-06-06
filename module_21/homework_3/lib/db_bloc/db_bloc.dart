
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/repository/users_helper.dart';
import '../repository/secure_storage/card_storage.dart';
import '../repository/users.dart';


part  'db_state.dart';
part  'db_event.dart';


class DbBloc extends Bloc<DbEvent,DbState>{

   final UserDatabase _userDatabase/*=UserDatabase()*/;
   final CardStorage _cardStorage;



  DbBloc(UserDatabase userDatabase,CardStorage cardStorage):_userDatabase=userDatabase,_cardStorage=cardStorage,
        super(InitDb()){
    on<GetAllUsersEvent>(_getAllUsersEvent);
    on<InsertUserEvent>(_insertUserEvent);
    on<DeleteUserEvent>(_deleteUserEvent);
    on<UpdateUserEvent>(_updateUserEvent);
  }


  _getAllUsersEvent(GetAllUsersEvent event, Emitter<DbState>emit)/*async*/async{
//рабочий код для future списка юзеров
   /* await _userDatabase.getAllUsers.then((value) {
       //emit(AllUsersState().copyWith(users: value.toList()));
    });*/

      emit(AllUsersState().copyWith(cardNumbers: await _cardStorage.readAllSecureData()));

    await emit.forEach (
        _userDatabase.usersStream,
        onData: (List<User> users)  {
          return AllUsersState().copyWith(users: users);
        });
  }


   _insertUserEvent(InsertUserEvent event, Emitter<DbState>emit)async{
     _userDatabase.insertUser(event.userHelper);

     User u=await _userDatabase.getLastRow();
     print(u.id);
     String key='${u.id}_${event.userHelper.name}';
     await _cardStorage.addCard(key,event.userHelper.cardNumber.toString());
     //var a=await _cardStorage.readAllSecureData();
     //emit(AllUsersState().copyWith(users:(state as AllUsersState).users,cardNumbers:a));
    print('write');
   }




  _deleteUserEvent(DeleteUserEvent event, Emitter<DbState>emit){
    _userDatabase.deleteUser(event.index);
  }

  _updateUserEvent(UpdateUserEvent event, Emitter<DbState>emit){
   _userDatabase.updateUser(event.userHelper,event.id);
  }

}