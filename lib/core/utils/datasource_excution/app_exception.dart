abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

final class InternetConnectionException extends ApiException {
  const InternetConnectionException({required super.message})
    : super(statusCode: 503);
}

final class ApiTimeoutException extends ApiException {
  const ApiTimeoutException({required super.message}) : super(statusCode: 408);
}

final class BadRequestException extends ApiException {
  const BadRequestException({
    required super.message,
    int super.statusCode = 400,
  });
}

final class UnauthorizedException extends ApiException {
  const UnauthorizedException({
    required super.message,
    int super.statusCode = 401,
  });
}

final class ForbiddenException extends ApiException {
  const ForbiddenException({
    required super.message,
    int super.statusCode = 403,
  });
}

final class NotFoundException extends ApiException {
  const NotFoundException({required super.message, int super.statusCode = 404});
}

final class InternalServerErrorException extends ApiException {
  const InternalServerErrorException({
    required super.message,
    int super.statusCode = 500,
  });
}

final class CertificateException extends ApiException {
  const CertificateException({required super.message}) : super(statusCode: 503);
}

final class RequestCancelledException extends ApiException {
  const RequestCancelledException({required super.message})
    : super(statusCode: 408);
}

final class UnknownApiException extends ApiException {
  const UnknownApiException({required super.message}) : super(statusCode: 500);
}

final class DataParsingException extends ApiException {
  const DataParsingException({required super.message}) : super(statusCode: 500);
}
