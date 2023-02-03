
import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architexture/View/login_view.dart';
import 'package:mvvm_architexture/View/signup_view.dart';
import 'package:mvvm_architexture/View/splash_view.dart';

import '../../View/home_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignUpView());


      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Route defined"),
            ),
          );
        });
    }

  }
}