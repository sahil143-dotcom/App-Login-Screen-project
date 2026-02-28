

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
   SnackBar(content: Text("Enter correct password",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
 );
 return;
}

bool userAccountNot = !userService.checkIfUserAlreadyHasAccount(userName: email);
if(userAccountNot){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Account doesn't exists bro!!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
  );
  return;
}
  UserModel? dbUser = userService.authenticateUser(userName: email, password: password);
  bool wrongCredentials = (dbUser ==null);
if(wrongCredentials){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please enter correct details ",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
  );
  return;
}

currentUser = dbUser;
notifyListeners();

ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Succefully logged in!!!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,)
);
return;
}


}
