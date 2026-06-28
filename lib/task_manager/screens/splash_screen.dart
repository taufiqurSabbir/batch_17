import 'package:batch_17/task_manager/controller/auth_controller.dart';
import 'package:batch_17/task_manager/screens/main_nav_screen.dart';
import 'package:batch_17/task_manager/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/screen_bg.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      moveToNextScreen();
    });

  }

  Future<void>moveToNextScreen()async {

    Future.delayed(Duration(seconds: 5));
    await AuthController.getUserData();
    bool isLogin = await AuthController.usUserLogin();
    if(isLogin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));

    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(
        child: Center(child: Image.asset(AssetPath.logoPNG, width: 270)),
      ),
    );
  }
}
