import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'text_field_event.dart';

part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextEditingController controller = TextEditingController();

  TextFieldBloc()
      : super(const TextFieldState(
            text: 'https://radioultra.ru/uploads/photos/1/2021/01/Korn.jpg')) {
    on<TextFieldEvent>((TextFieldEvent event, Emitter<TextFieldState> emit) {
      emit(TextFieldState(
        text: event.newText,
      ));
    });
  }
}
