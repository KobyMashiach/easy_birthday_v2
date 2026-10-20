import 'dart:async';

import 'package:easy_birthday/core/services/session_service.dart';
import 'package:easy_birthday/features/user/domain/usecases/save_user_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_login_bloc.freezed.dart';

@freezed
sealed class FirstLoginEvent with _$FirstLoginEvent {
  const factory FirstLoginEvent.continuePressed() = _ContinuePressed;
}

@Freezed(equal: false)
sealed class FirstLoginState with _$FirstLoginState {
  const factory FirstLoginState.initial() = Initial;
  const factory FirstLoginState.navigateToHome() = NavigateToHome;
}

extension FirstLoginStateX on FirstLoginState {
  bool get isOneShot => switch (this) {
    Initial() => false,
    NavigateToHome() => true,
  };
}

class FirstLoginBloc extends Bloc<FirstLoginEvent, FirstLoginState> {
  final SaveUserUseCase saveUserUseCase;

  FirstLoginBloc({required this.saveUserUseCase}) : super(const .initial()) {
    on<_ContinuePressed>(_continuePressed);
  }

  factory FirstLoginBloc.fromContext(BuildContext context) =>
      FirstLoginBloc(saveUserUseCase: context.read<SaveUserUseCase>());

  FutureOr<void> _continuePressed(
    _ContinuePressed event,
    Emitter<FirstLoginState> emit,
  ) {
    // Not awaited: the save shouldn't hold up entering the app.
    unawaited(
      saveUserUseCase(
        SessionService().user.copyWith(registerComplete: true),
      ).catchError((Object e) => debugPrint('FirstLoginBloc save user: $e')),
    );
    emit(const .navigateToHome());
  }
}
