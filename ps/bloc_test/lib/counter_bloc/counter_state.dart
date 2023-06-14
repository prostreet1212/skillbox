part of 'counter_bloc.dart';

abstract class CounterState extends Equatable{}


class GetCounterState extends CounterState{
  int count;
  String text;

  GetCounterState({this.count =  0,this.text='текст'});

  GetCounterState copyWith({int? count,String? text}){
    return GetCounterState(count: count??this.count,text: text??this.text);
  }

  @override
  List<Object?> get props => [count,text];
}

class LoadingCounterState extends CounterState{
  @override
  List<Object?> get props => [];
}