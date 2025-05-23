enum LogType {
  trace,
  debug,
  info,
  warning,
  error,
  fatal,
}

abstract class AppLogger {
  void trace({required String source, required String message});
  void debug({required String source, required String message});
  void info({required String source, required String message});
  void warning({required String source, required String message});
  void error({required String source, required String message});
  void fatal({
    required String source,
    required String message,
    dynamic error,
    StackTrace? stackTrace,
  });
}