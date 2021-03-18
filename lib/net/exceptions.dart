class ModelException implements Exception {
  final message;
  final prefix;

  ModelException([this.message, this.prefix]);

  String toString() {
    return "$prefix$message";
  }
}

///for general purposes when don't want to handle data.
///For example: 404 page not found, 500 internal server error,...
class UnhandledDataException extends ModelException {
  UnhandledDataException([String message])
      : super(message, "Some data are unhandled: ");
}

///throw when can not connect to server or DB
class ConnectionException extends ModelException {
  ConnectionException([String message])
      : super(message, "");
}

class BadRequestException extends ModelException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ModelException {
  UnauthorisedException([message]) : super(message, "");
}

class UnexpectedDataException extends ModelException {
  UnexpectedDataException([message]) : super(message, "");
}

///for specific purpose: handling error when not found somethings.
///For example: not found a phone number, an user,..
class NotFoundException extends ModelException {
  NotFoundException([message]) : super(message, "Not found Error: ");
}

class PermissionException extends ModelException {
  PermissionException([String message])
      : super(message, "Permission Error: ");
}

class UnProcessableEntityException extends ModelException {
  UnProcessableEntityException([String message])
      : super(message, "");
}