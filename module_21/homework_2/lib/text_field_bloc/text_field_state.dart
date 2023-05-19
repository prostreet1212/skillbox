part of 'text_field_bloc.dart';

class TextFieldState extends Equatable{
  final String text;


  TextFieldState({required this.text});

  @override
  List<Object> get props => [text];

  TextFieldState copyWith({required String? text}){
    return TextFieldState(text: text??this.text);

  }
}