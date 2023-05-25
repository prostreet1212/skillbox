import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/db_bloc/db_bloc.dart';
import '../repository/users_helper.dart';

class DbScreen extends StatelessWidget {
  const DbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DbBloc, DbState>(
        builder: (context, state) {
          if (state is InitDb) {
            return  const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if ((state as AllUsersState).users.isNotEmpty) {
              var users = state.users;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(users[i].id.toString()),
                          Text(users[i].name),
                          Text(users[i].surname),
                        ],
                      ),
                    );
                  });
            } else {
              return const Text('empty');
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //добавление юзера
         /* BlocProvider.of<DbBloc>(context)
              .add(InsertUserEvent(userHelper: UserHelper(name: 'test',surname: 'testov')));*/
          //удаление юзера
          /*BlocProvider.of<DbBloc>(context)
              .add(DeleteUserEvent(index: 6));*/

          //Изменение юзера
          BlocProvider.of<DbBloc>(context).add(UpdateUserEvent(userHelper: UserHelper(name: '123',surname: '456'),id: 7));
        },
      ),
    );
  }
}
