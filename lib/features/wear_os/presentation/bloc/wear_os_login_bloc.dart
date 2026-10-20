import 'dart:async';

import 'package:easy_birthday/features/wear_os/data/models/phone_login_reply.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/send_phone_login_request_usecase.dart';
import 'package:easy_birthday/features/wear_os/domain/usecases/watch_phone_login_replies_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wear_os_login_bloc.freezed.dart';

/// What the login page tells the user (the page picks the text).
enum WearOsLoginStatus {
  welcome,
  waitingForPhone,
  phoneNotResponding,
  loginSuccessful,
  noOwner,
  loginFailed,
  sendFailed,
}

@freezed
sealed class WearOsLoginEvent with _$WearOsLoginEvent {
  const factory WearOsLoginEvent.init() = _Init;
  const factory WearOsLoginEvent.requestLogin() = _RequestLogin;
  const factory WearOsLoginEvent.replyReceived(PhoneLoginReply reply) =
      _ReplyReceived;
}

@Freezed(equal: false)
sealed class WearOsLoginState with _$WearOsLoginState {
  const factory WearOsLoginState.initial(WearOsLoginStatus status) = Initial;

  /// A login request is being sent / waits for the phone's answer.
  const factory WearOsLoginState.loading(WearOsLoginStatus status) = Loading;
  const factory WearOsLoginState.loaded(WearOsLoginStatus status) = Loaded;
  const factory WearOsLoginState.errorMessage(
    WearOsLoginStatus status,
    String error,
  ) = ErrorMessage;
  const factory WearOsLoginState.navigateToCategories(
    WearOsLoginStatus status,
    String eventId,
  ) = NavigateToCategories;
}

extension WearOsLoginStateX on WearOsLoginState {
  bool get isOneShot => switch (this) {
    Initial() || Loading() || Loaded() || ErrorMessage() => false,
    NavigateToCategories() => true,
  };
}

class WearOsLoginBloc extends Bloc<WearOsLoginEvent, WearOsLoginState> {
  final SendPhoneLoginRequestUseCase sendPhoneLoginRequestUseCase;
  final WatchPhoneLoginRepliesUseCase watchPhoneLoginRepliesUseCase;

  /// How long to wait for the phone before asking to open the app there.
  final Duration replyTimeout;

  /// How long "login successful" shows before opening the event.
  final Duration successDelay;

  StreamSubscription<PhoneLoginReply>? _replies;

  /// Completed by the next reply of the phone; armed before each request is
  /// sent so a fast reply can't be missed.
  Completer<void>? _replyCompleter;

  bool _sending = false;

  WearOsLoginBloc({
    required this.sendPhoneLoginRequestUseCase,
    required this.watchPhoneLoginRepliesUseCase,
    this.replyTimeout = const Duration(seconds: 30),
    this.successDelay = const Duration(seconds: 1),
  }) : super(const .initial(.welcome)) {
    on<_Init>(_init);
    on<_RequestLogin>(_requestLogin);
    on<_ReplyReceived>(_replyReceived);
  }

  factory WearOsLoginBloc.fromContext(BuildContext context) {
    return WearOsLoginBloc(
      sendPhoneLoginRequestUseCase: context
          .read<SendPhoneLoginRequestUseCase>(),
      watchPhoneLoginRepliesUseCase: context
          .read<WatchPhoneLoginRepliesUseCase>(),
    );
  }

  FutureOr<void> _init(_Init event, Emitter<WearOsLoginState> emit) {
    // Kept for the page's lifetime: the phone may answer after the timeout.
    _replies ??= watchPhoneLoginRepliesUseCase().listen(
      (reply) {
        final completer = _replyCompleter;
        if (completer != null && !completer.isCompleted) completer.complete();
        add(.replyReceived(reply));
      },
      onError: (Object e) => debugPrint('WearOsLoginBloc replies: $e'),
    );
  }

  FutureOr<void> _requestLogin(
    _RequestLogin event,
    Emitter<WearOsLoginState> emit,
  ) async {
    if (_sending) return;
    _sending = true;
    emit(.loading(state.status));
    try {
      final completer = _replyCompleter = Completer<void>();
      await sendPhoneLoginRequestUseCase();
      if (!completer.isCompleted) emit(const .loading(.waitingForPhone));
      final bool responded = await completer.future
          .then((_) => true)
          .timeout(replyTimeout, onTimeout: () => false);
      if (!responded) {
        emit(const .loaded(.phoneNotResponding));
      } else if (state is Loading) {
        emit(.loaded(state.status));
      }
    } catch (e) {
      debugPrint('WearOsLoginBloc send login request: $e');
      emit(.errorMessage(.sendFailed, e.toString()));
    } finally {
      _sending = false;
    }
  }

  FutureOr<void> _replyReceived(
    _ReplyReceived event,
    Emitter<WearOsLoginState> emit,
  ) async {
    final reply = event.reply;
    switch (reply.status) {
      case .success:
        emit(const .loaded(.loginSuccessful));
        await Future<void>.delayed(successDelay);
        if (reply.eventId case final String eventId) {
          emit(.navigateToCategories(.loginSuccessful, eventId));
        }
      case .partner:
        emit(const .loaded(.noOwner));
      case .failed:
        emit(const .loaded(.loginFailed));
    }
  }

  @override
  Future<void> close() async {
    await _replies?.cancel();
    return super.close();
  }
}
