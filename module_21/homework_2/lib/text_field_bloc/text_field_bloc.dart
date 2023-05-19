import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_field_event.dart';

part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super(TextFieldState(text: 'https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg')) {
    on<TextFieldEvent>(
        (TextFieldEvent event, Emitter<TextFieldState> emit)  {
      //yield TextFieldState(event.newText);
      //emit(TextFieldState(event.newText));
          emit(state.copyWith(text: event.newText));
    });
  }
}
