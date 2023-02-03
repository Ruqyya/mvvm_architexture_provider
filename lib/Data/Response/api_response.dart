
 import 'package:mvvm_architexture/Data/Response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data);
  ApiResponse.loading() : status = Status.Loading;
  ApiResponse.completed() : status = Status.Completed;
  ApiResponse.error() : status = Status.Error;
  @override
  String tostring(){
    return "Status : $status \n Message : $message \n Data : $data";
  }
 }