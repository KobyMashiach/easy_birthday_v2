import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_register_event.dart';
part 'first_register_state.dart';

class FirstRegisterBloc extends Bloc<FirstRegisterEvent, FirstRegisterState> {
  FirstRegisterBloc() : super(FirstRegisterInitial()) {
    on<FirstRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
