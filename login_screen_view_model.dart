

import 'package:flutter/material.dart';
import 'package:gulab_jamun/user_class.dart';
import 'package:gulab_jamun/user_service.dart';
import 'package:stacked/stacked.dart';

class LoginScreenViewModel extends BaseViewModel{
  //all the business logic related to login screen goes here only!!!

  BuildContext context;
  UserModel? currentUser;
  LoginScreenViewModel({required this.context});


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

final userService = UserService();

bool get isLogggedIn=>currentUser!=null;

void userLogin(){
String email = emailController.text;
String password = passwordController.text;

bool notValid = !userService.validatePassword(password:password);
if (notValid){
 ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(content: Text("password corrrect ga enter chey raa puka",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
 );
 return;
}

bool userAccountNot = !userService.checkIfUserAlreadyHasAccount(userName: email);
if(userAccountNot){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Account ledu raa LAbbe!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
  );
  return;
}
  UserModel? dbUser = userService.authenticateUser(userName: email, password: password);
  bool wrongCredentials = (dbUser ==null);
if(wrongCredentials){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("correct details add chey lekapote dengey!!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
  );
  return;
}

currentUser = dbUser;
notifyListeners();

ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Saadhinchav poo login ayyavv sakkaga",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,)
);
return;
}

}