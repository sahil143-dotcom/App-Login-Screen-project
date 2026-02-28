import 'package:gulab_jamun/login_screen_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StackedView<LoginScreenViewModel>{
  const LoginScreen({super.key});

  @override
  Widget builder(BuildContext context, LoginScreenViewModel viewModel, Widget? child){
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),),
      body:Center(
        child: Column(
          children: [
          viewModel.isLogggedIn? Text("${viewModel.currentUser!.userName}has been successfully logged in"): Column(
              children: [
                TextField(
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    hintText: "enter your email",
                  ),
                ),
                TextField(
                  controller: viewModel.passwordController,
                  decoration: InputDecoration(
                    hintText: "enter password",
                  ),
                ),
                ElevatedButton(onPressed: viewModel.userLogin, child: Text("Login")),
              ]
          )
        ]
        ),
      )
    );
  }
  @override
  LoginScreenViewModel viewModelBuilder(BuildContext context){
  return LoginScreenViewModel(context: context);
  }

}