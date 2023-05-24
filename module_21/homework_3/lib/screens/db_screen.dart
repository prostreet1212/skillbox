import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_3/db_bloc/db_bloc.dart';

import '../repository/users.dart';

class DbScreen extends StatelessWidget {
  const DbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DbBloc,DbState>(
        builder: (context,state){
          if(state is InitDb){
            return CircularProgressIndicator();
          }else{
            if((state as AllUsersState).users.isNotEmpty){
              var users=(state as AllUsersState).users;
              return   ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,i){
                  return Card(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Text(users[i].name),
                  Text(users[i].surname),
                  ],
                  ),);}
                  );
            }else{
              return Text('empty');
            }
          }

        },

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //BlocProvider.of<DbBloc>(context).add(GetAllUsersEvent());
          BlocProvider.of<DbBloc>(context).add(InsertUserEvent(user: User(id:3,name: '123',surname: '456')));
        },

      ),
    );
  }
}


