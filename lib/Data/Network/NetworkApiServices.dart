
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_architexture/Data/Network/BaseApiServices.dart';
import 'package:mvvm_architexture/Data/app_exceptions.dart';
import 'package:http/http.dart'as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getPostApiResponse(String url, data)async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponse(String url, dynamic data)async {
    dynamic responseJson;
    try{
      Response response = await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;

  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions("Error Occured While Communicating with server"+ "with status code"+ response.statusCode.toString());
    }
  }
 
}