import 'package:batch_17/task_manager/screens/login_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:batch_17/task_manager/widget/screen_bg.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void onTapSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('Join with us', style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 25,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'First name'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'last name'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Mobile'
              ),
            ),
            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),

            FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined,size: 25,)),

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
      )),
    );
  }
}
