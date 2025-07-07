sealed class AppExceptionHelper implements Exception {
  final String message;

  AppExceptionHelper(this.message);
}

class NetworkException extends AppExceptionHelper {
  NetworkException(String message) : super('Network Error: $message');
}

class DataParsingException extends AppExceptionHelper {
  DataParsingException(String message) : super('Data Parsing Error: $message');
}

class UnauthorizedException extends AppExceptionHelper {
  UnauthorizedException()
    : super('Your session has expired. Please log in again.');
}

class UnexpectedException extends AppExceptionHelper {
  UnexpectedException()
    : super('An unexpected error occurred. Please try again later.');
}
