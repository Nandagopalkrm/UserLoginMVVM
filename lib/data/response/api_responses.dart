import 'package:user_login/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed() : status = Status.completed;
  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "{$status \n $message \n $data}";
  }
}
