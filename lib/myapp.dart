import 'package:flutter/material.dart';

import 'module_9/ui/task_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskHomePage(),
    );
  }
}
