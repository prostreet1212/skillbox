part of 'text_field_bloc.dart';

class TextFieldEvent extends Equatable {
  final String newText;

  const TextFieldEvent(this.newText);

  @override
  List<Object> get props => [newText];
}
