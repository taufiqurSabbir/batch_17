import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/model/api_response.dart';
import '../data/model/task_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';
import '../widget/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  List<TaskModel>tasks = [];

  Future<void> getAllTask() async {
    final ApiResponse response = await ApiCaller.getRequest(url: TMUrls.getTaskByStatusURL('Progress'));

    List<TaskModel> task = [];


    if(response.isSuccess){
      for(Map<String , dynamic>jsonData in (response.responseData['data'])){
        task.add(TaskModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(response.responseData['data']))));

    }


    setState(() {
      tasks = task;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  final task = tasks[index];
                  return TaskCard(taskModel: task, CardColor: Colors.purple, refreshParent: () async {
                    await getAllTask();
                  },);
                }),
          )


        ],
      ),
    );
  }
}
