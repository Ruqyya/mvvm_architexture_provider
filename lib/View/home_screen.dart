import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architexture/View_model/user_view_model.dart';
import 'package:mvvm_architexture/models/user_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference=  Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: (){
                userPreference.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text("Logout"))),
          SizedBox(width: 20,),
        ],
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
