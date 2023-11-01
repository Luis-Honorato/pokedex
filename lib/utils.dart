import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String errorMessage;
  final StackTrace? stackTrace;

  const Failure(this.errorMessage, this.stackTrace);

  @override
  List<Object?> get props => [errorMessage, stackTrace];
}

enum RequestStatus {
  inital,
  loading,
  failure,
  success,
}
