import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:homework_3/db_bloc/db_bloc.dart';
import 'package:uuid/uuid.dart';
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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if ((state as AllUsersState).users.isNotEmpty) {
              var users = state.users;
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
                              //Text(await storage.read(key: '${users[i].id}_${users[i].surname}')??'aaa'),
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
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.add),
        onPressed: () async{
          BlocProvider.of<DbBloc>(context).add(InsertUserEvent(
              userHelper: UserHelper(name: 'test', surname: 'testov',cardNumber: 123)));

        },
      ),
    );
  }
}
