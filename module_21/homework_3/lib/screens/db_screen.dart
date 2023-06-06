import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/db_bloc/db_bloc.dart';
import 'package:uuid/uuid.dart';
import '../repository/secure_storage/card_storage.dart';
import '../repository/users.dart';
import '../repository/users_helper.dart';

class DbScreen extends StatelessWidget {
  const DbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DbBloc(UserDatabase(),CardStorage()/*UserDatabase()*/)..add(GetAllUsersEvent()),
      child: Scaffold(
      appBar: AppBar(),
      body:  BlocBuilder<DbBloc, DbState>(
          builder: (context, state) {
            if (state is InitDb) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if ((state as AllUsersState).users.isNotEmpty) {
                var users = state.users;
                Map<String,String> cards=state.cardNumbers;
                print('length^ ${cards.length}');

                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onLongPress: () {
                          /* BlocProvider.of<DbBloc>(context).add(UpdateUserEvent(
                            userHelper: UserHelper(name: '123', surname: '456'),
                            id: users[i].id));*/
                        },
                        child: Dismissible(
                          key: Key(const Uuid().v1()),
                          onDismissed: (direction) {
                            BlocProvider.of<DbBloc>(context)
                                .add(DeleteUserEvent(index: users[i].id));
                          },
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(users[i].id.toString()),
                                Text(users[i].name),
                                Text(users[i].surname),
                                Text(cards['${users[i].id.toString()}_${users[i].name}']??'error'),

                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Text('empty');
              }
            }
          },
        ),
      floatingActionButton:Builder(
        builder: (context){
          return FloatingActionButton(
            mini: true,
            child: const Icon(Icons.add),
            onPressed: () async{
              BlocProvider.of<DbBloc>(context).add(InsertUserEvent(
                  userHelper: UserHelper(name: 'test', surname: 'testov',cardNumber: 2202)));

            },
          );
        },
      )
    ),);
  }
}
