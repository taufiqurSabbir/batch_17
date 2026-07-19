import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/api_response.dart';
import '../data/model/task_model.dart';
import '../data/service/api_caller.dart';
import '../providers/task_provider.dart';
import '../utils/urls.dart';
import '../widget/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getTaskByStatus('Progress');
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
        builder: (context,taskProvider,child) {
          return Column(

            children: [
              taskProvider.isLoading ? Center(child: CircularProgressIndicator(),) :  Expanded(
                child: ListView.builder(
                    itemCount: taskProvider.progressTask.length,
                    itemBuilder: (context,index){
                      final task = taskProvider.progressTask[index];
                      return TaskCard(taskModel: task, CardColor: Colors.blue, refreshParent: () async {
                        await taskProvider.getTaskByStatus('Progress');

                      },);
                    }),
              )


            ],
          );
        }
      ),
    );
  }
}
