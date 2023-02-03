import 'package:flutter/material.dart';
import 'package:mvvm_architexture/Utils/Routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../Utils/utils.dart';
import '../View_model/Auth_view_model.dart';
import '../res/Components/round_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cnicNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode cnicNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _cnicNumberController.dispose();
    emailFocusNode.dispose();
    userNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    cnicNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery
        .of(context)
        .size
        .height * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "user name",
                prefixIcon: Icon(Icons.person, color: Colors.teal,),
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
                    context, userNameFocusNode, emailFocusNode);
              },
            ),
            SizedBox(height:20 ,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.alternate_email_rounded, color: Colors.teal,),
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
            SizedBox(height: 20,),
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
                      prefixIcon: Icon(
                        Icons.lock_open_outlined, color: Colors.teal,),
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
                              : Icons.visibility, color: Colors.teal,)),
                    ),
                  );
                }),
            SizedBox(height: 20,),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone, color: Colors.teal,),
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
                    context, passwordFocusNode, phoneNumberFocusNode);
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _cnicNumberController,
              decoration: InputDecoration(
                hintText: "cnic#",
                prefixIcon: Icon(
                  Icons.card_membership_outlined, color: Colors.teal,),
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
                  context, phoneNumberFocusNode, cnicNumberFocusNode);
            },
          ),
          SizedBox(
            height: height * .05,
          ),
          RoundButton(
              title: "SignUp",
              loading: authViewModel.signUpLoading,
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
                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString(),
                  };
                  authViewModel.SignUpApi(data, context);
                  print("Api Hit");
                }
              }),
          SizedBox(
            height: height * .001,
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Center(child: Text("Don't have an account? ")),
                    Text(
                      "SignUp ",
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              )),
          ],
        ),
      ),
    ),)
    );
  }
}
