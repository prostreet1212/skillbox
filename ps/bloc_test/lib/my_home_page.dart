import 'package:bloc_test/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state){
            print('BUILD');
            if(state is GetCounterState){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.count.toString(),style: TextStyle(fontSize: 36),),
                  Text(state.text),
                ],
              );
            }else{
              return CircularProgressIndicator();
            }
          },

        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(CounterIncrementEvent(3));
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.bookmark_added),
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(ChangeTextEvent('новый текст'));
            },
          ),
        ],
      ),
    );
  }
}
