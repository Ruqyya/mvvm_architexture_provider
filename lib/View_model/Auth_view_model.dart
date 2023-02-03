
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Repository/auth_repository.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architexture/Utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  setSignupLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<dynamic> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode)
        print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  Future<dynamic> SignUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.SignUpApi(data).then((value) {
      Utils.flushBarErrorMessage("SignUp Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode)
        print(value.toString());
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}