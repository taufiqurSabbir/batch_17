import 'package:batch_17/task_manager/providers/auth_provider.dart';
import 'package:batch_17/task_manager/providers/task_provider.dart';
import 'package:batch_17/task_manager/screens/splash_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'module_10/class_1.dart';
import 'module_10/crud/crud.dart';
import 'module_9/ui/task_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
        ChangeNotifierProvider(create: (_)=>TaskProvider()),
      ],

      child: MaterialApp(
        theme: ThemeData(

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,

              hintStyle: TextStyle(
                  color: Colors.grey
              ),

              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),

              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),

            ),


            filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
                    backgroundColor: AppColors.PColor,
                    fixedSize: Size.fromWidth(double.maxFinite),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                )
            ),


            textTheme: TextTheme(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28
                )
            )
        ),

        home: SplashScreen(),
      ),


    );
  }
}
