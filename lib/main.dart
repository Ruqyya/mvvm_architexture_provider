import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architexture/View/login_view.dart';
import 'package:mvvm_architexture/View_model/Auth_view_model.dart';
import 'package:mvvm_architexture/View_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'Utils/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => AuthViewModel()),
         ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}

