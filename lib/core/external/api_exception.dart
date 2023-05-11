import 'package:equatable/equatable.dart';

import 'api_response.dart';

class ApiException extends Equatable {
  const ApiException(this.response);
  final ApiResponse response;

  @override
  List<Object?> get props => [response];
}
