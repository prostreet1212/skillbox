


import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc():super(LoadingCounterState()){

    on<CounterIncrementEvent>((event,emit) {
      if(state is LoadingCounterState){
        emit(GetCounterState());
      }
      int newCount= (state as GetCounterState).count+event.value;
      emit(GetCounterState().copyWith(count:newCount,text: (state as GetCounterState).text));
    });

    on<ChangeTextEvent>((event,emit){
      emit(GetCounterState().copyWith(count:(state as GetCounterState).count,text: event.newText));
    });
  }

}