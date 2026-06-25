import 'package:batch_17/task_manager/data/model/api_response.dart';
import 'package:batch_17/task_manager/data/service/api_caller.dart';
import 'package:batch_17/task_manager/screens/login_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:batch_17/task_manager/widget/screen_bg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../module_10/crud/utils/urls.dart';
import '../utils/urls.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void onTapSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>signUp() async {




    final ApiResponse response = await ApiCaller.PostRequest(url: TMUrls.SignUpURL,
    body: {
      "email":emailController.text,
      "firstName":firstNameController.text,
      "lastName":lastNameController.text,
      "mobile":mobileController.text,
      "password":passwordController.text,
    }

    );


    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up success....!')));


    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Text('Join with us', style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 25,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter email';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(

                    hintText: 'First name'
                ),

                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter firstName';
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                    hintText: 'last name'
                ),

                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter lastName';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: mobileController,
                decoration: InputDecoration(
                    hintText: 'Mobile'
                ),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return 'Please enter mobile';
                  }else if(value.length != 11){
                    return 'Please enter correct mobile number';
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter password';
                  }else{
                    return null;
                  }
                },
              ),

              FilledButton(onPressed: (){
                if(formkey.currentState!.validate()){

                  signUp();
                }
              }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,)),

              SizedBox(height: 35,),

              Center(
                child: Column(
                  children: [

                    RichText(text: TextSpan(
                        text: "Already have account? ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: 'Sign in', style: TextStyle(
                              color: AppColors.PColor,
                              fontWeight: FontWeight.bold
                          ),
                              recognizer: TapGestureRecognizer()..onTap = onTapSignIn
                          )
                        ]
                    ))
                  ],
                ),
              )

            ],
          ),
        ),
      )),
    );
  }
}
