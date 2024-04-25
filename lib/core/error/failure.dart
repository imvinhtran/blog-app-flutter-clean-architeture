class Failure {
  final String message;

  Failure(this.message);

  Failure.unexpectedError([this.message = 'An unexpected error occurred']);
}
