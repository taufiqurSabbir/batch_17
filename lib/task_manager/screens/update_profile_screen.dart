import 'package:batch_17/task_manager/controller/auth_controller.dart';
import 'package:batch_17/task_manager/data/model/api_response.dart';
import 'package:batch_17/task_manager/data/model/user_model.dart';
import 'package:batch_17/task_manager/data/service/api_caller.dart';
import 'package:batch_17/task_manager/screens/login_screen.dart';
import 'package:batch_17/task_manager/screens/main_nav_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:batch_17/task_manager/widget/screen_bg.dart';
import 'package:batch_17/task_manager/widget/tm_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../module_10/crud/utils/urls.dart';
import '../utils/urls.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>updateProfile() async {

    Map<String,dynamic> requestBody = {
        "email":emailController.text,
        "firstName":firstNameController.text,
        "lastName":lastNameController.text,
        "mobile":mobileController.text,
      };

    if(passwordController.text.isNotEmpty){
      requestBody['password'] = passwordController.text;
    }





    final ApiResponse response = await ApiCaller.PostRequest(url: TMUrls.updateProfileURL,
        body: requestBody

    );


    if(response.isSuccess){
      UserModel user = UserModel(
        sId: AuthController.userData?.sId,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobile: mobileController.text,
      );

      AuthController.updateUserData(user);
      AuthController.getUserData();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign up success....!')));


    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserModel user = AuthController.userData!;


    emailController.text = user.email!;
    firstNameController.text = user.firstName!;
    lastNameController.text = user.lastName!;
    mobileController.text = user.mobile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Text('Update Profile', style: Theme.of(context).textTheme.titleLarge,),
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
              ),

              FilledButton(onPressed: (){
                if(formkey.currentState!.validate()){

                 updateProfile();
                }
              }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,)),

              SizedBox(height: 35,),



            ],
          ),
        ),
      )),
    );
  }
}
