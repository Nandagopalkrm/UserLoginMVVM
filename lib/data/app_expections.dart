class AppException implements Exception {
  final message;
  AppException(this.message);

  @override
  String toString() {
    return "$message";
  }
}

//Custom Exceptions
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super("Error during communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super("Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super("Unauthorized Request");
}

class InvaildInputException extends AppException {
  InvaildInputException([String? message]) : super("Invalid Input");
}
