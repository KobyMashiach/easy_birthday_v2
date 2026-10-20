/// App-level failure. Repositories throw it; blocs catch it and emit an
/// `errorMessage` state.
class AppException implements Exception {
  final AppErrorType type;
  final String message;

  const AppException(this.type, {this.message = ''});

  @override
  String toString() => 'AppException($type): $message';
}

enum AppErrorType {
  cancelled,
  networkError,
  unauthorized,
  notFound,
  alreadyExists,
  wrongPassword,
  invalidInput,
  unknown,
}
