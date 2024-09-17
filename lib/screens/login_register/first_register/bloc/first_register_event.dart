part of 'first_register_bloc.dart';

@immutable
abstract class FirstRegisterEvent {}

class FirstRegisterEventOwnDetails extends FirstRegisterEvent {
  final PersonaModel persona;

  FirstRegisterEventOwnDetails({required this.persona});
}

class FirstRegisterEventPartnerDetails extends FirstRegisterEvent {
  final PersonaModel persona;

  FirstRegisterEventPartnerDetails({required this.persona});
}

class FirstRegisterEventChooseColor extends FirstRegisterEvent {
  final Color color;

  FirstRegisterEventChooseColor({required this.color});
}
