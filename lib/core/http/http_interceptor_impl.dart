import 'package:http_interceptor/http_interceptor.dart';

import '../../utils/app_logger.dart';


class HttpInterceptorImpl extends InterceptorContract {
  static const logSource = 'http_interceptor_impl.dart';
  static const httpOkStatus = 200;
  final AppLogger appLogger;
  final String apiUrl;

  HttpInterceptorImpl({
    required this.appLogger,
    required this.apiUrl,
  });

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final message = _buildRequestMessage(request);
    _logInfo(message);

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    final message = _buildResponseMessage(response);

    if (response.statusCode != httpOkStatus) {
      _logError(message);
      return response;
    }

    _logInfo(message);
    return response;
  }

  String _buildRequestMessage(BaseRequest request) {
    if (request is Request) {
      return 'url: ${request.url} - body: ${request.body}';
    }
    return 'url: ${request.url}';
  }

  String _buildResponseMessage(BaseResponse response) {
    if (response is Response) {
      return 'status code: ${response.statusCode} - body: ${response.body}';
    }
    return 'status code: ${response.statusCode}';
  }

  void _logInfo(String message) {
    appLogger.info(source: logSource, message: message);
  }

  void _logError(String message) {
    appLogger.error(source: logSource, message: message);
  }
}
