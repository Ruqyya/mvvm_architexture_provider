import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architexture/View_model/Auth_view_model.dart';
import 'package:mvvm_architexture/res/Components/round_button.dart';
import 'package:provider/provider.dart';

import '../Utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Login"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration:  InputDecoration(
                    hintText: "Email",
                    label: Text("Email",style: TextStyle(color: Colors.teal),),
                    prefixIcon: Icon(Icons.alternate_email_rounded,color: Colors.teal,),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.tealAccent,
                        width: 1,
                      ),),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1,
                      ),
                    ),


                  ),
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
                SizedBox(height: 15,),
                ValueListenableBuilder(
                    valueListenable: _obscurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword.value,
                        focusNode: passwordFocusNode,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "Password",
                          label: Text("Password",style: TextStyle(color: Colors.teal),),
                          prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.teal,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.tealAccent,
                              width: 1,
                            ),),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 1,
                            ),
                          ),


                          suffixIcon: InkWell(
                              onTap: () {
                                _obscurePassword.value = !_obscurePassword.value;
                              },
                              child: Icon(_obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,color: Colors.teal,)),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * .05,
                ),
                RoundButton(
                    title: "Login",
                    loading: authViewModel.loading,
                    onPress: () {
                      if (_emailController.text.isEmpty) {
                        Utils.flushBarErrorMessage("Please Enter Email", context);
                      } else if (_passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please Enter Password", context);
                      } else if (_passwordController.text.length < 6) {
                        Utils.flushBarErrorMessage(
                            "Please enter 6 digit password", context);
                      } else {
                        // Map data ={
                        //   "email": _emailController.text.toString(),
                        //   "password": _passwordController.text.toString(),
                        // };
                        Map data = {
                          "email": "eve.holt@reqres.in",
                          "password": "cityslicka",
                        };
                        authViewModel.loginApi(data, context);
                        print("Api Hit");
                      }
                    }),
                SizedBox(
                  height: height * .02,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signUp);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text("Don't have an account? ")),
                        Text(
                          "SignUp ",
                          style: TextStyle(
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
