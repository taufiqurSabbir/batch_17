import 'dart:convert';

import 'package:batch_17/task_manager/controller/auth_controller.dart';
import 'package:batch_17/task_manager/data/model/user_model.dart';
import 'package:batch_17/task_manager/screens/main_nav_screen.dart';
import 'package:batch_17/task_manager/screens/sign_up_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:batch_17/task_manager/widget/screen_bg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../data/model/api_response.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>signIn() async {




    final ApiResponse response = await ApiCaller.PostRequest(url: TMUrls.SignInURL,
        body: {
          "email":emailController.text,
          "password":passwordController.text,
        }

    );


    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);

      String accessToken = response.responseData['token'];
      AuthController.saveUserData(model, accessToken);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign In success....!')));


    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }


  void onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 250,),
            Text('Get Started With', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 25,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 10,),

            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),

            FilledButton(onPressed: (){
              signIn();
            }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,)),

            SizedBox(height: 35,),

            Center(
              child: Column(
                children: [
                  TextButton(onPressed: (){}, child: Text('Forget Password ?',style: TextStyle(color: Colors.grey),)),

                  RichText(text: TextSpan(
                    text: "Don't have an account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: 'Sign Up', style: TextStyle(
                        color: AppColors.PColor,
                        fontWeight: FontWeight.bold
                      ),
                        recognizer: TapGestureRecognizer()..onTap = onTapSignUp
                      )
                    ]
                  ))
                ],
              ),
            )

          ],
        ),
      )),
    );
  }
}
