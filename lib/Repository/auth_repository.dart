
import 'package:mvvm_architexture/Data/Network/BaseApiServices.dart';
import 'package:mvvm_architexture/Data/Network/NetworkApiServices.dart';
import 'package:mvvm_architexture/res/app_url.dart';

class AuthRepository {

  BaseApiService _apiServices = NetworkApiService();
  Future<dynamic>loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic>SignUpApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}