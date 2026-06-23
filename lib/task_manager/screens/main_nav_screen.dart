import 'package:batch_17/task_manager/screens/cancel_task_screen.dart';
import 'package:batch_17/task_manager/screens/completed_task_screen.dart';
import 'package:batch_17/task_manager/screens/new_task_screen.dart';
import 'package:batch_17/task_manager/screens/progress_task_screen.dart';
import 'package:batch_17/task_manager/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widget/tm_appbar.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;

  List screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(

        selectedIndex: selectedIndex,
          onDestinationSelected: (int index){
          selectedIndex = index;
          setState(() {

          });
          },


          destinations: [
            NavigationDestination(icon: Icon(Icons.task), label: 'New'),
            NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
            NavigationDestination(icon: Icon(Icons.task_alt_outlined), label: 'Completed'),
            NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),

          ]),
    );
  }
}

