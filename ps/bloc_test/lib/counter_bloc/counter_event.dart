part of 'counter_bloc.dart';

abstract class CounterEvent {}


 class CounterIncrementEvent extends CounterEvent {
 int value;

 CounterIncrementEvent(this.value);
}

 class CounterDecrementEvent extends CounterEvent {
  int value;

  CounterDecrementEvent(this.value);
}


class ChangeTextEvent extends CounterEvent{
 String newText;

 ChangeTextEvent(this.newText);
}