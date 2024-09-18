// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'first_register_bloc.dart';

@immutable
abstract class FirstRegisterEvent {}

class FirstRegisterEventInit extends FirstRegisterEvent {}

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

class FirstRegisterEventChooseTexts extends FirstRegisterEvent {
  final Map<String, String> choosenTexts;

  FirstRegisterEventChooseTexts({required this.choosenTexts});
}

class FirstRegisterEventPlanPurchase extends FirstRegisterEvent {
  final String? planTitle;

  FirstRegisterEventPlanPurchase({required this.planTitle});
}

class FirstRegisterEventFinishRegister extends FirstRegisterEvent {}
