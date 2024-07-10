class GenericHttpException implements Exception {
  final String message;
  final int code;
  final Exception? error;
  final StackTrace? stackTrace;

  GenericHttpException({
    required this.message,
    required this.code,
    this.error,
    this.stackTrace
  });

  GenericHttpException.unknowError({this.error, this.stackTrace})
      : message = 'Une erreur inconnue est survenue',
        code = 520;
}