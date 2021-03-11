import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  int _errorCode;
  String _errorMessage = '';

  ServerError.withError(DioError error) {
    _handleError(error);
  }

  int get errorCode => _errorCode;

  String get errorMessage => _errorMessage;

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = 'Request was cancelled';
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = 'Connection timeout';
        break;
      // case DioErrorType.:
      //   _errorMessage = 'Connection failed due to internet connection.';
      //   break;
      case DioErrorType.receiveTimeout:
        _errorMessage = 'Receive timeout in connection.';
        break;
      case DioErrorType.response:
        _errorCode = error.response.statusCode;
        _errorMessage = error.response.data['message'][0];
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = 'Receive timeout in send request';
        break;
      case DioErrorType.other:
        // TODO: Handle this case.
        break;
    }
    return _errorMessage;
  }
}
