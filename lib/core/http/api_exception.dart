import 'package:equatable/equatable.dart';

class ApiException extends Equatable {
  final String errorMsg;

  const ApiException({
    required this.errorMsg,
  });

  @override
  List<Object> get props => [errorMsg];

  @override
  String toString() {
    return 'ApiException{errorMsg: $errorMsg}';
  }
}
