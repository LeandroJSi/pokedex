import 'package:logger/logger.dart';

import 'app_logger.dart';

class AppLoggerImpl implements AppLogger {
  final Logger logger;

  AppLoggerImpl({required this.logger});

  @override
  void trace({required String source, required String message}) {
    _log(type: LogType.trace, source: source, message: message);
  }

  @override
  void debug({required String source, required String message}) {
    _log(type: LogType.debug, source: source, message: message);
  }

  @override
  void info({required String source, required String message}) {
    _log(type: LogType.info, source: source, message: message);
  }

  @override
  void warning({required String source, required String message}) {
    _log(type: LogType.warning, source: source, message: message);
  }

  @override
  void error({required String source, required String message}) {
    _log(type: LogType.error, source: source, message: message);
  }

  @override
  void fatal({
    required String source,
    required String message,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _log(
      type: LogType.fatal,
      source: source,
      message: message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void _log({
    required LogType type,
    required String source,
    required String message,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    final formattedMessage = '[Source: $source] - Message: $message';
    switch (type) {
      case LogType.trace:
        logger.t(formattedMessage);
        break;
      case LogType.debug:
        logger.d(formattedMessage);
        break;
      case LogType.info:
        logger.i(formattedMessage);
        break;
      case LogType.warning:
        logger.w(formattedMessage);
        break;
      case LogType.error:
        logger.e(formattedMessage);
        break;
      case LogType.fatal:
        logger.f(formattedMessage, error: error, stackTrace: stackTrace);
        break;
    }
  }
}